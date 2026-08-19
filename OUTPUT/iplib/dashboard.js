(() => {
  "use strict";

  const data = window.IPLIB_DASHBOARD_DATA;
  const workspace = document.getElementById("workspace");
  const caseList = document.getElementById("case-list");
  const search = document.getElementById("search");
  const state = { selected: data?.cases?.[0]?.name, testIndex: 0, query: "" };
  const number = new Intl.NumberFormat("zh-CN");

  if (!data) {
    workspace.innerHTML = '<div class="loading">dashboard-data.js 加载失败。</div>';
    return;
  }

  const escapeHtml = value => String(value ?? "").replace(/[&<>'"]/g, char => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", "'": "&#39;", '"': "&quot;"
  })[char]);

  function codeLines(source) {
    return String(source || "").split("\n").map((line, index) =>
      `<span class="code-line" data-line="${index + 1}">${escapeHtml(line) || " "}</span>`
    ).join("");
  }

  function bitValue(value, representation) {
    if (!/^\d+$/.test(value) || (!representation.includes("64") && !representation.includes("fp64"))) return value;
    try { return `0x${BigInt(value).toString(16).toUpperCase().padStart(16, "0")}`; }
    catch { return value; }
  }

  function visibleCases() {
    const needle = state.query.trim().toLowerCase();
    return data.cases.filter(item => !needle || item.name.toLowerCase().includes(needle));
  }

  function renderCaseList() {
    const cases = visibleCases();
    if (!cases.some(item => item.name === state.selected)) state.selected = cases[0]?.name;
    caseList.innerHTML = cases.length ? cases.map(item => `
      <button class="case-item ${item.name === state.selected ? "active" : ""}" data-case="${escapeHtml(item.name)}" type="button">
        <i class="dot ${item.state === "evidence-complete" ? "complete" : "archived"}"></i>
        <span class="name">${escapeHtml(item.name)}</span>
        <span class="count">${number.format(item.vectors)}</span>
      </button>`).join("") : '<div class="loading">没有匹配项</div>';
    caseList.querySelectorAll("[data-case]").forEach(button => button.addEventListener("click", () => {
      state.selected = button.dataset.case;
      state.testIndex = 0;
      renderCaseList();
      renderWorkspace();
    }));
  }

  function sampleFor(mapping, vector) {
    const values = vector.slice(mapping.columnStart, mapping.columnEnd + 1)
      .map(value => bitValue(value, mapping.representation));
    if (values.length <= 3) return values.join(", ");
    return `${values.slice(0, 2).join(", ")}, …, ${values.at(-1)}`;
  }

  function columnLabel(mapping) {
    return mapping.columnStart === mapping.columnEnd
      ? `vector[${mapping.columnStart}]`
      : `vector[${mapping.columnStart}..${mapping.columnEnd}]`;
  }

  function mappingRows(item, test) {
    return item.variableMappings.map(mapping => `
      <tr>
        <td><span class="direction ${mapping.direction === "out" ? "out" : ""}">${mapping.direction === "in" ? "输入" : "输出"}</span></td>
        <td class="var-name">${escapeHtml(mapping.cName)}</td>
        <td class="arrow">→</td>
        <td class="columns">${escapeHtml(columnLabel(mapping))}</td>
        <td class="arrow">→</td>
        <td class="rocq-name">${escapeHtml(mapping.rocqName)}</td>
        <td class="encoding">${escapeHtml(mapping.representation)}</td>
        <td class="sample-value">${escapeHtml(sampleFor(mapping, test.vector))}</td>
      </tr>`).join("");
  }

  function artifactLinks(item) {
    const labels = { readme: "README", spec: "spec.v", tests: "tests.v", vectors: "vectors.txt", checklist: "checklist", coqc: "coqc evidence", freshness: "freshness" };
    return Object.entries(item.links).filter(([, href]) => href).map(([key, href]) =>
      `<a href="${escapeHtml(href)}">${labels[key]} ↗</a>`
    ).join("");
  }

  function renderWorkspace() {
    const item = data.cases.find(entry => entry.name === state.selected);
    if (!item) return;
    const complete = item.state === "evidence-complete";
    const test = item.sampleTests[state.testIndex] || item.sampleTests[0];
    const testOptions = item.sampleTests.map((entry, index) =>
      `<option value="${index}" ${index === state.testIndex ? "selected" : ""}>${entry.name}</option>`
    ).join("");

    workspace.innerHTML = `
      <header class="case-header">
        <div>
          <small>CASE / ${item.inputColumns} INPUT COLUMNS / ${item.outputColumns} OUTPUT COLUMNS</small>
          <h1>${escapeHtml(item.name)}</h1>
          <p>${escapeHtml(item.summary)}</p>
        </div>
        <span class="status ${complete ? "complete" : ""}">${complete ? "当前证据完整" : "历史结果 · 待补标准证据"}</span>
      </header>

      <div class="section-title"><b>01</b> 代码 / 规约 / 测试三元组</div>
      <section class="triptych">
        <article class="code-panel">
          <div class="panel-head"><div><strong>C 实现</strong><small>${escapeHtml(item.cSourcePath)}</small></div><span class="language">C</span></div>
          <div class="code-scroll"><pre class="code-block">${codeLines(item.cSource)}</pre></div>
        </article>
        <article class="code-panel">
          <div class="panel-head"><div><strong>Rocq 规约</strong><small>${escapeHtml(item.links.spec)}</small></div><a class="open-file" href="${escapeHtml(item.links.spec)}">打开 ↗</a></div>
          <div class="code-scroll"><pre class="code-block">${codeLines(item.specSource)}</pre></div>
        </article>
        <article class="code-panel">
          <div class="panel-head"><div><strong>可执行测试用例</strong><small>前 ${item.sampleTests.length} 条可切换 / 共 ${number.format(item.positiveTheorems)} 条</small></div><select class="test-selector" id="test-selector">${testOptions}</select></div>
          <div class="code-scroll"><pre class="code-block">${codeLines(test.code)}</pre></div>
        </article>
      </section>

      <div class="section-title"><b>02</b> 变量对应关系 · ${test.name}</div>
      <div class="mapping-wrap">
        <table class="mapping-table">
          <thead><tr><th>方向</th><th>C 变量 / 字段</th><th></th><th>测试向量列</th><th></th><th>Rocq 参数 / 返回项</th><th>编码</th><th>本例实际值</th></tr></thead>
          <tbody>${mappingRows(item, test)}</tbody>
        </table>
      </div>

      <div class="section-title"><b>03</b> 测试结果</div>
      <section class="results">
        <div class="result-primary">
          <span class="result-mark ${complete ? "complete" : ""}">${complete ? "✓" : "!"}</span>
          <div><small>${complete ? "FIXED COQC CHECK" : "ARCHIVED RESULT"}</small><strong>${number.format(item.positiveTheorems)} / ${number.format(item.vectors)} 正例</strong></div>
        </div>
        <div class="result-item"><span>Rocq 检查</span><strong>${item.coqcStatus === "passed" ? "PASS" : "待补证据"}</strong><code>${escapeHtml(item.coqVersion || "no archived evidence")}</code></div>
        <div class="result-item"><span>向量新鲜性</span><strong>${item.freshnessStatus === "passed" ? "PASS" : "待补证据"}</strong><code>${escapeHtml(item.seed || "seed not in new schema")}</code></div>
        <div class="result-item"><span>阴性控制</span><strong>${item.negativeControl ? "PASS" : "未归档"}</strong><code>${item.formalClean ? "formal files clean" : "formal review required"}</code></div>
      </section>
      <p class="result-note">${complete ? `当前 tests.v 已通过固定 coq_tooling.py check${item.seconds ? `，用时 ${item.seconds}s` : ""}；fresh build 与归档 vectors.txt 逐字节一致。` : "现有 spec.v、tests.v、vectors.txt 和 README 保留历史测试结果，但缺少当前标准要求的完整 JSON evidence bundle 或归档式阴性控制；这里不把它标成当前证据通过。"}</p>
      <nav class="artifact-row">${artifactLinks(item)}</nav>`;

    document.getElementById("test-selector").addEventListener("change", event => {
      state.testIndex = Number(event.target.value);
      renderWorkspace();
    });
  }

  document.getElementById("total-cases").textContent = data.summary.cases;
  document.getElementById("total-tests").textContent = number.format(data.summary.positiveTheorems);
  search.addEventListener("input", () => { state.query = search.value; renderCaseList(); renderWorkspace(); });
  renderCaseList();
  renderWorkspace();
})();
