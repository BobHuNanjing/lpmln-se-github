# LPMLN强等价条件自动证明程序

#### 文件说明
+ .vscode visual studio code 编辑器中用到的相关文件
+ main 用于自动证明的ASP程序目录
    + asp_rule_satisfaction.lp  定义ASP规则的满足情况
    + decision_tree_conditions.lp  声明决策树中的一个决策规则
    + lpmln_rule_satisfaction.lp  定义LPMLN归约的相关情况
    + lpmln_strong_equivalence_checking.lp  定义等价检查方法（求可能的$\overline{M_{Y}}^Y$)
    + search_spaces.lp  定义搜索空间
    + set_relationships.lp  定义集合运算及其关系
    + output_filter.lp  输出控制
+ test 测试用程序目录
    + 文件与main中文件对应
+ resouces 其它文件
+ solve.bat 执行推理脚本