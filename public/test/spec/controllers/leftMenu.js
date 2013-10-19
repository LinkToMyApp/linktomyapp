'use strict';

describe('Controller: LeftmenuCtrl', function () {

  // load the controller's module
  beforeEach(module('linkToMyAppApp'));

  var LeftmenuCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    LeftmenuCtrl = $controller('LeftmenuCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
