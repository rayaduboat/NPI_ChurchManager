var app = angular.module('myApp', []);
app.controller('myCtrl', function ($scope, $http) {
    $scope.title = 'Forgotten password';
    $scope.email = '';
    $scope.isUpdated = false;
    $scope.isError = false;
    $scope.message = '';
    $scope.spin = false;
    $scope.subtitle = 'Enter your email address to receive a new password';
    $scope.reminder = function () {
        $scope.spin = true;
        let action = (d) => {
            if (d.Data =='Email address unrecognised') {
                $scope.isUpdated = false;
                $scope.isError = true;
                $scope.message = d.Data;
            } else {
                $scope.isUpdated = true;
                $scope.isError = false;
                $scope.message = d.Data;
            }
            $scope.spin = false;
            $scope.$applyAsync()
        };
        if ($scope.email.length>0) {
            $scope.isError = false;
            $scope.message = '';
            fetch("ForgottenPassword.aspx/sendReminder", {
                method: 'POST',
                body: JSON.stringify({ email: $scope.email }),
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json; charset=utf-8'
                }

            })
                .then((r) => {

                    return r.json();
                })
                .then((response) => {
                    action(response.d)
                    //$scope.isUpdated = true;
                    //$scope.message = (response.d);
                    //return r;
                })
                .catch(function (e) {
                    $scope.isError = true;
                    $scope.message = (e);
                })


        } else {
            $scope.isError = true;
            $scope.message = 'oopsy please enter email';  
            $scope.spin = false;
        }
       

    }
    $scope.back = () => { location.href='/default.aspx' };
    $scope.keyUp = () => {
        if ($scope.email.length == 0) {
            $scope.isError = true;
            $scope.message = 'oopsy please enter email';
        } else {
            $scope.isError = false;
            $scope.message = '';
        }
    }
})