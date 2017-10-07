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

<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
 
String date1 = formatter.format(currentTime); //将日期时间格式化 
%>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">茶叶品级管理系统</a>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">添加</a></li>
                <li><a href="statistics.jsp">统计</a></li>
                <li class="active"><a href="vote.jsp">投票</a></li>
                <li><a href="score.jsp">作业要求</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-7">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">群众最喜欢的茶叶</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row" id="teaVote">
                           
                      
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">排行榜    <%=date1 %>    </h3>
                    </div>
                    <div class="panel-body">

                        <!-- 图表要绘制到这里，设定宽度和高度 -->
                        <div id="chart1" style="height:370px;">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="loginModalLabel">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                      <input type="number" class="form-control" placeholder="请输入手机号" id="phone" >
                    </div>
                    <div>
                    	<span id="error"></span>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="checkLogin()">登录</button>
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

            // 加载完毕页面就加载排行榜
            loadRank();

            // 然后每两秒更新一次排行榜，自己修改为 30 s
            setInterval('loadRank()', 30000);
            
            loadTea();
        })

        // 投票
        function addVote(id) {
        	$.ajax({
				type : 'POST',

				url : 'http://localhost:8080/tea/voteTea/addVote',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({

					"id" : id

				}),

				dataType : 'json',

				success : function(data) {

					if(data.errorCode == -1000){
						$('#loginModal').modal();
					}else{
						loadTea();
					}
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
        }
        
        function loadTea(){
        	
        	$("#teaVote").empty("");   // 清除某个标签
        	
        	$.ajax({
				type : 'GET',

				url : 'http://localhost:8080/tea/voteTea/list',

				async : true,

				

				success : function(data) {

					// 填充table中的数据
					$.each(data,function(index, obj) {$("#teaVote").append(
							 " <div class='col-md-3'> <div style='background-color:burlywood; padding:10px;margin-top:5px' ><img src='img/"+
							 obj.image+"' class='img-thumbnail'><button class='btn btn-default' type='button' onclick='addVote("+
									 obj.id+")' style='width:100%; margin-top:10px;'>投票("+obj.vote+")</button></div></div>")
											})
	

				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
        }

        // 获取排行榜
        function loadRank() {
        	
        	$.ajax({
				type : 'GET',

				url : 'http://localhost:8080/tea/voteTea/listFront',

				async : true,

				success : function(data) {
						var names=data[1];
						var votes=data[0];
					var addedInfo = new Array();
					for(var i=7, j=0; i>=0; i--,j++){ // addedInfo是从0开始， names和votes是从7开始降序
						addedInfo[j] = names[i]+" <br/>得票数 :" + votes[i]
					}
					
					
					 // 指定图表的配置项和数据
		            var option = {
		                title: {
		                    text: '得票数'
		                },
		                tooltip: {// 鼠标放上展示的提示信息格式
		                    trigger: 'item',
		                    formatter: function(param) {
		                    	return addedInfo[param.dataIndex];
		                    }// 设置茶叶名称
		                },
		                xAxis: {
		                    type: 'value',
		                },
		                yAxis: {
		                    type: 'category',
		                    data: ["第8名", "第7名", "第6名", "第5名", "第4名", "第3名", "第2名", "第1名"]
		                },
		                series: [{
		                    type: 'bar',//==============使用得票数填充 data
		                    data: [
		                    		
		                    		votes[7],votes[6],votes[5],votes[4],votes[3],votes[2],votes[1],votes[0]
		                    	],
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

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
        	
        	}
        	
        	function checkLogin(){
        		
        		var standar = /^1[3|4|5|7|8][0-9]{9}$/;
        		
        		var phone = $("#phone").val();
        		var flag = standar.test(phone);
        		if(flag == true){
        			
        			$.ajax({
        				type : 'POST',

        				url : 'http://localhost:8080/tea/voteTea/checkPhone',

        				async : true,

        				contentType : 'application/json',

        				data : JSON.stringify({

        					"phone" :$("#phone").val() 

        				}),

        				dataType : 'json',

        				success : function(data) {

        					if(data.errorCode == 1){
        						 $("#loginModal").modal('hide');
        					}
        				},

        				error : function(msg) {
        					alert(JSON.stringify(msg));
        				}
        			});
        			
        			
        		}else{
        			
        			$("#error").html("请输入正确的手机号！");
        		}
        		
        		
        	}
        	
        	
           
    </script>
</body>

</html>