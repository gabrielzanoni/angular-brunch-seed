'use strict'

### Controllers ###

angular.module('app.controllers', [])

.controller('AppCtrl', [
  '$rootScope'
  '$location'
  '$scope'
  '$resource'
  

($rootScope, $location, $scope, $resource) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])

.controller('MyCtrl1', [
  '$scope'

($scope) ->
  $scope.onePlusOne = 2
])

.controller('MyCtrl2', [
  '$scope'

($scope) ->
  $scope
])

.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    @todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    count = 0
    angular.forEach @todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = @todos
    @todos = []
    angular.forEach oldTodos, (todo) ->
      $scope.todos.push todo  unless todo.done

])

.controller('TestController', [
  '$scope'

  ($scope) ->

    $scope.collection = [
      path: "#/view1"
      name: "view1"
    ,
      path: "#/view2"
      name: "view2"
    ,
      path: "#/todo"
      name: "todo"
    ]

])



