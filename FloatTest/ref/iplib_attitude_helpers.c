/* Shared deterministic fp64 attitude helpers for iplib differential tests. */
#include <math.h>
#include <stddef.h>
#include <string.h>

void MatrixMulti333(double *out, const double *a, const double *b)
{
	double temp[9] = {0};
	unsigned i, j, k;
	for (i = 0; i < 3u; ++i)
		for (j = 0; j < 3u; ++j)
			for (k = 0; k < 3u; ++k)
				temp[i * 3u + j] += a[i * 3u + k] * b[k * 3u + j];
	memcpy(out, temp, sizeof temp);
}

void MatrixMulti331(double *out, const double *a, const double *b)
{
	double temp[3] = {0};
	unsigned i, k;
	for (i = 0; i < 3u; ++i)
		for (k = 0; k < 3u; ++k)
			temp[i] += a[i * 3u + k] * b[k];
	memcpy(out, temp, sizeof temp);
}

/* 主动右手元旋转（README 附录给出完整约定）：
 * A1(a)=[1 0 0; 0 ca -sa; 0 sa ca]，A2/A3 同理；
 * Angle2C<ijk> = A_i(a_i)·A_j(a_j)·A_k(a_k)，ai 为绕第 i 轴角。 */

void Angle2C123(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = -c2 * s3;              o[2] = s2;
	o[3] = c1 * s3 + s1 * s2 * c3; o[4] = c1 * c3 - s1 * s2 * s3; o[5] = -s1 * c2;
	o[6] = s1 * s3 - c1 * s2 * c3; o[7] = c1 * s2 * s3 + s1 * c3; o[8] = c1 * c2;
}

void Angle2C132(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = -s3;                   o[2] = s2 * c3;
	o[3] = c1 * s3 * c2 + s1 * s2; o[4] = c1 * c3;              o[5] = c1 * s2 * s3 - s1 * c2;
	o[6] = s1 * s3 * c2 - c1 * s2; o[7] = s1 * c3;              o[8] = c1 * c2 + s1 * s2 * s3;
}

void Angle2C213(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3 + s1 * s2 * s3; o[1] = -c2 * s3 + s1 * s2 * c3; o[2] = s2 * c1;
	o[3] = c1 * s3;               o[4] = c1 * c3;               o[5] = -s1;
	o[6] = c2 * s1 * s3 - s2 * c3; o[7] = s2 * s3 + c2 * s1 * c3; o[8] = c2 * c1;
}

void Angle2C231(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = s2 * s1 - c2 * s3 * c1; o[2] = s2 * c1 + c2 * s3 * s1;
	o[3] = s3;                    o[4] = c3 * c1;               o[5] = -c3 * s1;
	o[6] = -s2 * c3;              o[7] = c2 * s1 + s2 * s3 * c1; o[8] = c2 * c1 - s2 * s3 * s1;
}

void Angle2C312(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3 - s1 * s2 * s3; o[1] = -c1 * s3;             o[2] = s2 * c3 + s1 * c2 * s3;
	o[3] = c2 * s3 + s1 * s2 * c3; o[4] = c1 * c3;              o[5] = s2 * s3 - s1 * c2 * c3;
	o[6] = -c1 * s2;              o[7] = s1;                    o[8] = c1 * c2;
}

void Angle2C321(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = s1 * s2 * c3 - c1 * s3; o[2] = c1 * s2 * c3 + s1 * s3;
	o[3] = c2 * s3;               o[4] = s1 * s2 * s3 + c1 * c3; o[5] = c1 * s2 * s3 - s1 * c3;
	o[6] = -s2;                   o[7] = s1 * c2;               o[8] = c1 * c2;
}

/* Shepperd 法 DCM→四元数（q[3] 标量部）；输入为物理 DCM，sqrt 参数非负 */
void C2Q(double *out, const double *m)
{
	double tr = m[0] + m[4] + m[8];
	double s;
	if (tr > 0.0) {
		s = sqrt(tr + 1.0) * 2.0;
		out[3] = 0.25 * s;
		out[0] = (m[7] - m[5]) / s;
		out[1] = (m[2] - m[6]) / s;
		out[2] = (m[3] - m[1]) / s;
	} else if (m[0] > m[4] && m[0] > m[8]) {
		s = sqrt(1.0 + m[0] - m[4] - m[8]) * 2.0;
		out[0] = 0.25 * s;
		out[1] = (m[1] + m[3]) / s;
		out[2] = (m[2] + m[6]) / s;
		out[3] = (m[7] - m[5]) / s;
	} else if (m[4] > m[8]) {
		s = sqrt(1.0 + m[4] - m[0] - m[8]) * 2.0;
		out[1] = 0.25 * s;
		out[0] = (m[1] + m[3]) / s;
		out[2] = (m[5] + m[7]) / s;
		out[3] = (m[2] - m[6]) / s;
	} else {
		s = sqrt(1.0 + m[8] - m[0] - m[4]) * 2.0;
		out[2] = 0.25 * s;
		out[0] = (m[2] + m[6]) / s;
		out[1] = (m[5] + m[7]) / s;
		out[3] = (m[3] - m[1]) / s;
	}
}

void Q2C(double *o, const double *q)
{
	double q1 = q[0], q2 = q[1], q3 = q[2], q4 = q[3];
	o[0] = 1.0 - 2.0 * (q2*q2 + q3*q3);
	o[1] = 2.0 * (q1*q2 - q3*q4);
	o[2] = 2.0 * (q1*q3 + q2*q4);
	o[3] = 2.0 * (q1*q2 + q3*q4);
	o[4] = 1.0 - 2.0 * (q1*q1 + q3*q3);
	o[5] = 2.0 * (q2*q3 - q1*q4);
	o[6] = 2.0 * (q1*q3 - q2*q4);
	o[7] = 2.0 * (q2*q3 + q1*q4);
	o[8] = 1.0 - 2.0 * (q1*q1 + q2*q2);
}

void QMulti(double *o, const double *p, const double *q)
{
	double t[4];
	t[0] = p[3]*q[0] + q[3]*p[0] + (p[1]*q[2] - p[2]*q[1]);
	t[1] = p[3]*q[1] + q[3]*p[1] + (p[2]*q[0] - p[0]*q[2]);
	t[2] = p[3]*q[2] + q[3]*p[2] + (p[0]*q[1] - p[1]*q[0]);
	t[3] = p[3]*q[3] - ((p[0]*q[0] + p[1]*q[1]) + p[2]*q[2]);
	memcpy(o, t, sizeof t);
}

void MatrixIdentity33(double *out)
{
	unsigned i;
	for (i = 0; i < 9u; ++i) out[i] = 0.0;
	out[0] = 1.0;
	out[4] = 1.0;
	out[8] = 1.0;
}

void Memcpyx(unsigned char *destination, const unsigned char *source,
             unsigned int nbytes)
{
	memcpy(destination, source, nbytes);
}

double VectorNorm3(const double *v)
{
	return sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
}

void CS_Angle2C(double *out, const double *angles, unsigned int seq)
{
	switch (seq) {
	case 123: Angle2C123(out, angles[0], angles[1], angles[2]); break;
	case 132: Angle2C132(out, angles[0], angles[1], angles[2]); break;
	case 213: Angle2C213(out, angles[0], angles[1], angles[2]); break;
	case 231: Angle2C231(out, angles[0], angles[1], angles[2]); break;
	case 312: Angle2C312(out, angles[0], angles[1], angles[2]); break;
	default:  Angle2C321(out, angles[0], angles[1], angles[2]); break;
	}
}
