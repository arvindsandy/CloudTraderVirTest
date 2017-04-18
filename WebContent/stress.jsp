
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--
 Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Sample HTML file -->

<HTML>
<HEAD>
    <META http-equiv="Content-Style-Type" content="text/css">
    <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
    <META http-equiv="Content-Style-Type" content="text/css">


		<script src="//ajax.googleapis.com/ajax/libs/dojo/1.6.2/dojo/dojo.xd.js"
				data-dojo-config="isDebug: true,parseOnLoad: true">
		</script>
		<script>
		dojo.require("dojo.cookie");

			function ajaxCall(reqURL, output, work) {

				dojo.xhrGet({
					url: reqURL,
					load: function(newContent, ioargs) {
						console.log(reqURL);
						dojo.byId("output").innerHTML +=("\rOK : " + reqURL);
						if(output){dojo.byId("output").innerHTML +="\r" + newContent;}
						if(work){
							work();
							}
						
					},
					error: function() {
						console.log("ERROR : " + reqURL);
					},
					handle: function(){
						dojo.byId("time").innerHTML = (new Date().getTime() -n)/1000 + " seconds";	
					},
					preventCache: true,
					sync:true
				});

				
			}



			dojo.ready(function() {

				var d = new Date();
				n = d.getTime();
				console.log(n);

				var buyAndSell = function() {
					ajaxCall("port.jsp", true);
					ajaxCall("app?action=buy&symbol=s7&quantity=10");
					ajaxCall("app?action=buy&symbol=s7&quantity=14");
					ajaxCall("app?action=buy&symbol=s7&quantity=8");
					ajaxCall("app?action=buy&symbol=s4&quantity=20");
					ajaxCall("app?action=buy&symbol=s3&quantity=20");
					ajaxCall("app?action=buy&symbol=s3&quantity=18");
					ajaxCall("app?action=buy&symbol=s2&quantity=40");
					ajaxCall("app?action=buy&symbol=s1&quantity=5");
					ajaxCall("app?action=sell");
					ajaxCall("app?action=sell");
					ajaxCall("app?action=sell");
					ajaxCall("app?action=sell");
				};

				//Login - then, buy and sell.
				for (i = 0; i < 10; i++) {
						ajaxCall("clearCookies.jsp");
						ajaxCall("app?action=login&stress=true&uid=uid:" + i
								+ "&passwd=xxx", false, buyAndSell);
						
				}
			});

			
		</script>
	</head>
<BODY bgcolor="#ffffff" link="#000099">
<%!
    private long fib(int n) {
        if (n <= 1) return n;
        else return fib(n-1) + fib(n-2);
    }
%>

<%
//=fib(1) 
%>

<%

System.out.println("Stressin..");%>

	<div id = "time">Please wait...</div>
	<textarea style = "height: 80%;width:100%" id = "output"></textarea>
	<div id = "output2"></div>


</BODY>
</HTML>









