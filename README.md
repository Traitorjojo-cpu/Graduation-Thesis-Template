本模版参考2022届学长开源的模版制作而成。根据《浙江工业大学数学科学学院毕业论文规范2026》对模版进行调整与简化。
《浙江工业大学理学院毕业论文规范2026》规范本身就有或多或少的问题，是否还需要修改要再问。



可以参考学长模板的项目地址以及他的博客：

* [Github](https://github.com/AsukaEva2/ZJUTbachelor)
* [Gitee](https://gitee.com/asukaeva2/zjutbachelor)

他的博客[浙江工业大学本科毕业论文LaTeX模板](https://haoyufang.gitee.io/2022/03/24/%E6%B5%99%E6%B1%9F%E5%B7%A5%E4%B8%9A%E5%A4%A7%E5%AD%A6%E6%9C%AC%E7%A7%91%E6%AF%95%E4%B8%9A%E8%AE%BA%E6%96%87LaTeX%E6%A8%A1%E6%9D%BF/)和[正儿八经学习LaTeX](https://haoyufang.gitee.io/2022/03/01/%E6%AD%A3%E5%84%BF%E5%85%AB%E7%BB%8F%E5%AD%A6%E4%B9%A0LaTex/)

欢迎本学院以及LaTeX开发者、爱好者一起使用和维护。

![16b692877f4312853cb988b45eca021](./README/2026-4-28.jpg)

<!--more-->

# 更新日志



# 模板框架

```mermaid
graph LR
	模板--编译-->main.tex
	模板--样式-->ZJUTbachelor.cls
	模板--参考文献宏包-->gbt7714.sty
	模板--参考文献格式-->gbt7714-2005-unsrt.bst
	模板--参考文献数据库-->ref.bib
	模板--思源黑体-->SourceHanSansSC.zip
	模板--删除编译辅助文件-->del.bat
	模板--章节-->parts
	parts-->第一章.tex
	parts-->第二章.tex
	parts-->第三章.tex
	parts-->致谢.tex
	parts-->附录.tex
	模板--图片-->pics
	pics-->logo.png
	pics-->...
	模板--插入PDF文件-->pdf
	pdf-->诚信承诺书.pdf
	pdf-->任务书.pdf
```



# 模板编译

感谢[思源黑体](https://github.com/adobe-fonts/source-han-sans/releases)提供的开源字体和[walkerguo](https://gitee.com/walkeraguo/gbt7714-bibtex-style)的提供的参考文献宏包支持。

首先要安装字体，解压`SourceHanSansSC.zip`文件，然后选中所有字体右键`为所有用户安装(A)。



打开`main.tex`文件，用xeLaTeX编译。将源文件分割成若干个文件，例如将每章内容单独写在一个文件中，会大大简化修改和校对的工作。

需要做的是更改个人信息、中文摘要、英文摘要、在正文插入章节等等。目录、参考文献（只需有`.bib`数据库）会自动生成、字体、字号、行距已经在`ZJUTbachelor.cls`中全部定义好。

重新编译最好删除辅助文件，特别是遇到目录、参考文献有报错的时候。双击`del.bat`文件即可删除辅助文件。



