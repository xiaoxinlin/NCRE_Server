'use strict';

/* Controllers */

function MyCtrl2() {
}
MyCtrl2.$inject = [];

//获取侧边公告栏的公告列表（7个）
var AnnoListCtrl = [
		'$scope',
		'$http',
		function($scope,$http){
			$http.get("http://localhost:8080/mavenDemo4/announcement/showIndexAnnouncement").success(function(data){
				$scope.annos = data;
			});
		}
];

//获取一个问题实例
var  QuestionDetailCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var quesId = $routeParams.quesId;
			//这里后续需要对参数进行判断处理
			//....
			$http.get("http://localhost:8080/mavenDemo4/question/show?id="+ quesId ).success(function(data){
				$scope.question = data;
			});
		}
];

//获取一个问题列表（14个）
var  QuestionsCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var quesPageId = $routeParams.quesPageId;
			//这里后续需要对参数进行判断处理
			//....
			$http.get("http://localhost:8080/mavenDemo4/question/index?id="+ quesPageId ).success(function(data){
				$scope.questions = data;
			});
		}
];

//获取一个公告实例
var  AnnouncementDetailCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var annoId = $routeParams.annoId;
			//这里后续需要对参数进行判断处理
			//....
			$http.get("http://localhost:8080/mavenDemo4/announcement/show?id="+ annoId ).success(function(data){
				$scope.announcement = data;
			});
		}
];

//获取一个公告列表（14个）
var AnnouncementsCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var annoPageId = $routeParams.annoPageId;
			//这里后续需要对参数进行判断处理
			//....
			$http.get("http://localhost:8080/mavenDemo4/announcement/index?id="+ annoPageId ).success(function(data){
				$scope.announcements = data;
			});
		}
];

//获取一个下载列表（14个）
var DownloadsCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var downPageId = $routeParams.downPageId;
			//这里后续需要对参数进行判断处理
			//....

			$http.get("http://localhost:8080/mavenDemo4/file/index?page="+ downPageId ).success(function(data){
				$scope.action = "";
				$scope.pageSize = data.pageSize;
				$scope.pageNumber = data.pageNumber;
				$scope.totalPage = data.totalPage;
				$scope.files = data.list;
				//console.log($scope.files);
			});
		
		}
];

//获取一个文件下载列表（14个）
var DownloadsDocCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var downPageId = $routeParams.downPageId;
			//var downType = $routeParams.downType;
			//这里后续需要对参数进行判断处理
			//....

			$http.get("http://localhost:8080/mavenDemo4/file/indexByType?page="+ downPageId + "&type=office" ).success(function(data){
				$scope.action = "doc/";
				$scope.pageSize = data.pageSize;
				$scope.pageNumber = data.pageNumber;
				$scope.totalPage = data.totalPage;
				$scope.files = data.list;
				//console.log($scope.files);
			});
		
		}
];


//获取一个软件下载列表（14个）
var DownloadsSoftwareCtrl = [
		'$scope',
		'$routeParams',
		'$http',
		function($scope,$routeParams,$http){
			var downPageId = $routeParams.downPageId;
			//var downType = $routeParams.downType;
			//这里后续需要对参数进行判断处理
			//....

			$http.get("http://localhost:8080/mavenDemo4/file/indexByType?page="+ downPageId + "&type=access" ).success(function(data){
				$scope.action = "software/";
				$scope.pageSize = data.pageSize;
				$scope.pageNumber = data.pageNumber;
				$scope.totalPage = data.totalPage;
				$scope.files = data.list;
				//console.log($scope.files);
			});
		
		}
];
