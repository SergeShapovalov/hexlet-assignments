# Testing

## Ссылки

* [Octokit](https://github.com/octokit/octokit.rb)
* [Webmock](https://github.com/bblimke/webmock)
* [Mocks Aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html)
* [from_url() method](http://octokit.github.io/octokit.rb/Octokit/Repository.html#from_url-class_method)

## Задачи

### Gemfile

Подключите гемы `octokit` (подключается всегда) и `webmock` (подключить только для тестирования)

### app/controllers/web/repositories_controller.rb

Реализуйте метод `create()`, который загружает информацию о репозитории c GitHub. Репозиторий добавляется ссылкой. Получить информацию о репозитории можно следующим образом:

```ruby
octokit_repo = Octokit::Repository.from_url(repository_url)

repository_data = client.repository(octokit_repo)

```

### test/test_helper.rb

Подключите `webmock/minitest` для подмены запросов.

### test/controllers/web/repositories_controller_test.rb

Добавьте тест для метода создания.  При тестировании должен выполняться перехват запроса в GitHub и подставляться ответ из фикстур *test/fixtures/files/response.json*. Для загрузки файла фикстур используйте метод `load_fixture()`.


