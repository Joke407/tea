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
                <li class="active"><a href="index.jsp">添加</a></li>
                <li><a href="statistics.jsp">统计</a></li>
                <li><a href="vote.jsp">投票</a></li>               
                <li><a href="score.jsp">作业要求</a></li>                                                                
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-6">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">添加茶叶</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" id="formId">
                            <div class="form-group">
                                <label for="input1" class="col-sm-2 control-label">形状</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input1" max="1" min="0" step="0.1" placeholder="形状" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="input2" class="col-sm-2 control-label">色泽</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input2" max="1" min="0" step="0.1" placeholder="色泽" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="input3" class="col-sm-2 control-label">净度</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input3" max="1" min="0" step="0.1" placeholder="净度" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="input4" class="col-sm-2 control-label">汤色</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input4" max="1" min="0" step="0.1" placeholder="汤色" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="input5" class="col-sm-2 control-label">香气</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input5" max="1" min="0" step="0.1" placeholder="香气" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="input6" class="col-sm-2 control-label">滋味</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input6" max="1" min="0" step="0.1" placeholder="滋味" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="input7" class="col-sm-2 control-label">叶底</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="input7" max="1" min="0" step="0.1" placeholder="叶底" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-default" onclick="loadRate()">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">茶叶品级相似度</h3>
                    </div>
                    <div class="panel-body">

                        <!-- 图表要绘制到这里，设定宽度和高度 -->
                        <div id="chart1" style="height:392px;">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

    <!-- 图表 js 库 -->
    <script src="js/echarts.min.js"></script>

    <script type="text/javascript">
        // 设置图表为全局变量
        var chart1 = null;

        $(document).ready(function () {

            // 基于准备好的 dom，初始化echarts实例，并设置全局变量 chart1
            chart1 = echarts.init(document.getElementById('chart1'));
        })

        // 提交评分
        function loadRate() {
			
        	 var inputArray=document.getElementsByTagName('input'); 
        	 for( var i=0; i<7; i++){
        		  if( inputArray[i].value==null || inputArray[i].value==''){ 
        			  alert("数据不能为空！");
        			  return;
        		  }
        		  if( inputArray[i].value>1 || inputArray[i].value<0){
        			  alert("茶叶的评分为 0-1 ");
        			  return;
        		  }
        	 }
        	
        	 $.ajax({
                 type:'POST',
                 
                 url:'http://localhost:8080/tea/insertTea/save',
                 
                 async:true,
                 //设置传输格式为json
                 contentType:'application/json;charset=utf-8',
                 
                 // 先创建字典对象，把字典对象转化为字符串
                 // 通过json的形式，给controller传递参数
                 data: JSON.stringify({
                	 "shape":$("#input1").val(),
                	 "color":$("#input2").val(),
                	 "neatness":$("#input3").val(),
                	 "colorTea":$("#input4").val(),
                	 "aroma":$("#input5").val(),
                	 "taste":$("#input6").val(),
                	 "leaves":$("#input7").val(),
                	 
                 }),
                 // 设置接受格式为json
                 dataType:'json',
                 
                // 请求成功的返回值， data
            success:function(data){
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '该茶叶属于 '+data.message
                    },
                    tooltip: {},
                    legend: {
                        data: ['相似度']
                    },
                    xAxis: {
                        data: ["特一级", "特二级", "特三级", "一级", "二级", "三级", "四级"]
                    },
                    yAxis: {},
                    series: [{
                        type: 'bar',// ==========请求成功，替换 data 中的数字
                        data: [data.data[0],data.data[1] , data.data[2], data.data[3], data.data[4],data.data[5], data.data[6]],
                        itemStyle: {
                            normal: {
                                color: function (param) {
                                    var colorList = [
                                        '#C1232B', '#B5C334', '#FCCE10', '#E87C25', '#27727B',
                                        '#FE8463', '#9BCA63'
                                    ];
                                    return colorList[param.dataIndex]
                                }
                            }
                        }
                    }]
                };
                

                // 使用指定的配置项和数据显示图表。
                chart1.setOption(option);
            },
            error:function(msg){
                
            }    
            });

        	
        	
           

        }
    </script>
</body>

</html>