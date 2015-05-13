<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restful WebSevice</title>
<script type="text/javascript" src="<c:url value='resources/js/jquery-2.1.3.min.js' />"></script>
<script type="text/javascript" src="<c:url value='resources/angular-1.4.0-rc.1/angular.min.js' />"></script>
<link rel="stylesheet" href="<c:url value='resources/bootstrap/css/bootstrap-theme.min.css' />" />
<link rel="stylesheet" href="<c:url value='resources/bootstrap/css/bootstrap.min.css' />" />
</head>
<body>
	<div ng-app="myApp">
		<div ng-controller="myController">
			<table class="table table-bordered">
				<tr>
					<th class="col-sm-4 col-lg-4">ID</th><th class="col-sm-4 col-lg-4">NAME</th><th class="col-sm-4 col-lg-4"></th>
				</tr>
				<tr ng-repeat="content in data">
					<td>{{content.id}}</td>
					<td>{{content.name}}</td>
					<td>
						<button role="button" class="btn btn-danger" ng-click="del($index, content)">삭제</button>
				</tr>
			</table>
			<div class="col-sm-12 col-lg-12">
				<label>삽입</label>
				<input type="text" ng-model="user.id" class="form-control" placeholder="ID" />
				<Input type="text" ng-model="user.name" class="form-control" placeholder="NAME" />
				<button role="button" class="btn btn-default btn-block" ng-click="insert()">삽입</button>
			</div>
		</div>
	</div>
	<script>
		var myApp = angular.module('myApp', []);
		myApp.controller('myController', function($scope, $http) {
			
			$http.get("/main.do").success(function(dat) {
				$scope.data = dat;
			})
			
			$scope.del = function(dat, con) {
				$http({
					  method: "DELETE"
					 ,url: "/main.do"
					 ,data: {id:con.id}
					 ,headers: {'Content-Type': 'application/json'}
				}).success(function() {
					$scope.data.splice(dat, 1);	
				});
			}
			
			$scope.insert = function() {
				$http({
					 method: "POST"
					,url: "/main.do"
					,data: {id:$scope.user.id, name:$scope.user.name}
					,headers: {'Content-Type': 'application/json'}
				}).success(function() {
					$scope.data.push({id:$scope.user.id, name:$scope.user.name});
				}).error(function(message) {
					alert(message.exception);
				});
			}
		});
	</script>
</body>
</html>