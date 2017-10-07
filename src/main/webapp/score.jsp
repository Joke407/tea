<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>茶叶管理系统</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">茶叶品级管理系统</a>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">添加</a></li>
                <li><a href="statistics.jsp">统计</a></li>
                <li><a href="vote.jsp">投票</a></li>
                <li class="active"><a href="score.jsp">作业要求</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">评分标准</div>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>功能列表</th>
                    <th>要求</th>
                </tr>
                <tr>
                    <td>复习 Java 基础</td>
                    <td></td>
                </tr>
                <tr>
                    <td>数据库设计</td>
                    <td>导出脚本，备份在项目中</td>
                </tr>
                <tr>
                    <td>ssm 框架搭建</td>
                    <td>使用 maven 完成，只引入需要的 jar 和需要的配置信息，不允许全部复制粘贴</td>
                </tr>
                <tr>
                    <td>添加页面-添加</td>
                    <td>做非 null 验证，都输入了才能提交，否则 alert('请填写全部内容')</td>
                </tr>
                <tr>
                    <td>添加页面-添加</td>
                    <td>数据库需要至少保存：7 个得分；最终等级；添加时间</td>
                </tr>
                <tr>
                    <td>添加页面-图表</td>
                    <td>请求结果展示在图表上。需要数据有：该茶叶和 7 个标准的相似度（算法不会写的话就返回 7 个 0 - 1 的随机数）；最终等级</td>
                </tr>
                <tr>
                    <td>统计页面-列表</td>
                    <td>分页；按品级排序（升降）；按添加时间排序（升降）</td>
                </tr>
                <tr>
                    <td>统计页面-统计图表</td>
                    <td>请求结果展示在图表上。需要数据有：每个等级茶叶的数量</td>
                </tr>
                <tr>
                    <td>统计页面-得分图表</td>
                    <td>请求结果展示在图表上。需要数据有：该茶叶的 7 个得分；最终等级</td>
                </tr>
                <tr>
                    <td>投票页面-列表</td>
                    <td>请求结果展示在列表上。需要数据有：图片；得票数</td>
                </tr>
                <tr>
                    <td>投票页面-投票</td>
                    <td>通过拦截器实现登录后才能投票</td>
                </tr>
                <tr>
                    <td>投票页面-登录</td>
                    <td>登录只输入手机号即可，登录前先进行手机号校验，是手机号了才发送请求</td>
                </tr>
                <tr>
                    <td>投票页面-图表</td>
                    <td>请求结果展示在图表上。需要数据有：前八名的名字和票数；服务器查询时间</td>
                </tr>
                <tr>
                    <td>使用 eolinker 管理接口文档</td>
                    <td></td>
                </tr>
                <tr>
                    <td>完成全部功能</td>
                    <td>+5 分</td>
                </tr>
                <tr>
                    <td>使用 git 管理代码</td>
                    <td>使用 oschina +2 分；使用 github +3 分；</td>
                </tr>
                <tr>
                    <td>项目发布</td>
                    <td>发布网络云服务器 + 10 分</td>
                </tr>
                <tr>
                    <td>ECharts 教程</td>
                    <td>详细的柱状图，饼状图，雷达图，折线图教程 +5 分</td>
                </tr>
            </table>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>

</html>