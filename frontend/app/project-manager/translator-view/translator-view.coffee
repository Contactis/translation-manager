angular.module('translation.pages.translator-view', [
  'translation.providers.userPermissionsSettings'
  'translator.directive.trEditTable'
  'ui.router'
  'ngCookies'
  'data-table'
  'ngMessages'
  'ngAnimate'
  'lbServices'
  'ui.bootstrap'
])

.config ($stateProvider, UserPermissionsSettingsProvider) ->

  access = UserPermissionsSettingsProvider.accessLevels

  $stateProvider.state 'app.manager.translator-view',
    url:            '/translator-view'
    controller:     'TranslatorViewController'
    controllerAs:   'vm'
    templateUrl:    'project-manager/translator-view/translator-view.tpl.html'
    data:
      access:       access.translator
    resolve:
      CurrentProjectResolver: (CurrentProjectService) ->
        return CurrentProjectService.getCurrentProject()
      LanguageListResolver: (LanguageService, CurrentProjectResolver) ->
        return LanguageService.getAllTranslationsForProject(CurrentProjectResolver.id)


.controller 'TranslatorViewController', ($log, TranslationKey, LanguageService, Translation, UserPermissionsSettings,
LanguageListResolver, CurrentProjectResolver) ->

  vm                  = this
  vm.query            = ""
  vm.filters          = {}
  vm.contextMenu      = {}
  vm.tableData        = []

  vm.accessLevels     = UserPermissionsSettings.accessLevels
  vm.currentProject   = CurrentProjectResolver

  _langList = LanguageListResolver.result
  vm.translateLanguage  = LanguageService.getTranslateLanguage(_langList, vm.currentProject.defaultLanguageId)
  vm.allLanguages       = _langList
  if vm.translateLanguage is undefined
    vm.translateLanguage = vm.allLanguages[0]


  (_fetchData = ->
    _defaultLanguageId = vm.currentProject.defaultLanguageId
    TranslationKey.find
      filter:
        include:[
          {
            relation: 'namespace'
          }
          {
            relation: 'translations'
            scope:
              where:
                or:[
                  {languageId: _defaultLanguageId},
                  {languageId: LanguageService.getTranslationLanguageIdOrFind(_defaultLanguageId, _langList)}
                ]
          }
        ]
        where:
          projectId: vm.currentProject.id
    .$promise.then (success)->
      vm.tableData = success
      vm.displayedCollection = [].concat(vm.tableData)
    , (error) ->
      $log.error 'Problem with loading translation keys', error
  )(@)


  vm.isTranslationForDefaultLanguage = () ->
    return if vm.currentProject.defaultLanguageId is vm.translateLanguage.id then true else false


  vm.updateLanguage = (lang) ->
    LanguageService.setTranslationLanguageId(lang.id)
    _fetchData()


  vm.deleteTranslation = (translationObject) ->
#    fixme translation id mocked
    Translation.deleteById { id:translationObject.translations[0].id }
    .$promise.then () ->

  return vm



