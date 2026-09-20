库文件的编写包括：
1. 基于原有的图抽象库（GraphLib）定义AVL的抽象性质及接口（对应binarytree.v，一般放在Rocq/GraphLib/directed下面
2. 写出具体实例化的图模型，并且证明在实例化图上抽象性质是成立的（对应bst.v，一般放在Rocq/GraphLib/examples下面
3. 定义相关的内存断言谓词，对应bst_lib_1.v，一般就放在Rocq/examples/...相关。

具体C函数的证明包括（这些文件的放置位置应该和正常验证操作系统程序类似）：
1. strategies的编写
2. 给C函数写spec和annotaions，然后完成导出VCs的证明。

然后验证的时候可以关注一下`tree_store`相关的定义，现在主要使用iter_sepcon定义而不是使用递归方式定义一棵树，那么在C程序的循环不变式中就可以说当前的指针指在图上的某些点，然后获得对应节点的权限。