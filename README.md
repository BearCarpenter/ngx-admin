# ngx-admin [<img src="https://i.imgur.com/oMcxwZ0.png" alt="Eva Design System" height="20px" />](https://eva.design) [![Build Status](https://travis-ci.org/akveo/ngx-admin.svg?branch=master)](https://travis-ci.org/akveo/ngx-admin) [![Dependency Status](https://david-dm.org/akveo/ngx-admin/status.svg)](https://david-dm.org/akveo/ng2-admin)

[Who uses ngx-admin?](https://github.com/akveo/ngx-admin/issues/1645)| [Documentation](https://akveo.github.io/ngx-admin/?utm_source=github&utm_medium=ngx_admin_readme&utm_campaign=themes) | [Installation Guidelines](https://akveo.github.io/ngx-admin/docs/getting-started/what-is-ngxadmin?utm_source=github&utm_medium=ngx_admin_readme&utm_campaign=themes)

-------------------------
## Work with teach-app

Niniejszy branch został utworzony w celu uniezależnienia środowiska hosta od środowiska wymaganego przez aplikację. Dzieje się to za pośrednictwem konteneryzacji aplikacji. Do odpalenia aplikacji potrzebny jest docker. Skupiono się na dwóch branchach dostępnych w open sourcowym templacie ngx-admin. Te branche to: 
- master - zawierający aplikację z wieloma komponentami i ich przykładowym wykorzystaniem - wychodzi z niego branch feature/docker-master z niezbędnymi plikami do odpalania w środowisku zkonteneryzowanym
- starter - zawierający czysty template do którego można dokładać dowolne komponenty - wychodzi z niego branch feature/docker-starter z niezbędnymi plikami do odpalania w środowisku zkonteneryzowanym

W zdalnym repozytorium dockerowym znajdują się obrazy posiadające pobrane node_modules, które następnie służą do uruchamiania kontenera na twoim komputerze.
W zdalnym repozytorium znajdują się:
- jojons/ngx-admin-modules:starter - dla packages z brancha starter z repozytorium ngx-admin
- jojons/ngx-admin-modules:master - dla packages z brancha master z repozytorium ngx-admin

### Odpalenie aplikacji
W celu odpalenia aplikacji w linii komend w folderze z aplikacją należy wykonać:
```
docker-compose up
# W rożnych sytuacjach może być zasadne użycie flagi --build
```
plik docker-compose.yaml uruchamia kontener który posiada już pobrane node_modules w katalogu poza aplikacją. Sam kod aplikacji jest podmontowany do kontenera dzięki czemu można dokonywać zmian w kodzie z pominięciem środowiska aplikacji. Po odpaleniu kontenera w katalogu z aplikacją pojawi się link/skrót który wewnątrz kontenera odwołuje się do prawdziwego folderu node_modules. 
Aplikacja jest hostowana na porcie 4300.

### Praca developerska
Praca developerska odbywa się poprzez podłączenie vscode do środka kontenera. Jest to wymagane ponieważ na systemie hosta nie istnieje katalog node_modules przez co programowanie w vscode jest prawie nie możliwe (podkreśla na czerwono większość importów z node_modules a co za tym idzie również kod).

W celu developowania należy:
1. zainstalować dodatek do vscode o nazwie 'Remote Development'
2. Odpalić kontener
3. Kliknąć na zielony przycisk w lewym dolnym i z opcji wybrać 'Attach to Runinng Container'

To powinno odpalić nową instancję vscode podłączoną do uruchomionego kontenera

### Aktualizowanie package.json i node_modules
Odpalenie kontenera z aplikacją oparte jest o wcześniejsze przekopiowanie folderu node_modules z obrazu kontenera który już zawiera pobrane paczki. Dodanie nowego wpisu np z kolejną biblioteką do package.json nie spowoduje tego że będzie ona dostępna w kontenerze z aplikacją ponieważ w obrazie przechowującym node_modules nie zostały one zaktualiowane.
Jeśli chcesz zaaktualizować node_modules musisz zaktualizować obraz przechowujący node_modules, a więc powinieneś:
1. wyłączyć działający kontener z aplikacją.
2. zaktualizować package.json o wpisy które chcesz zmienić.
3. wykonać w linii komend:
```
docker build -t jojons/ngx-admin-modules:[master/starter] -f Dockerfile.ngx-admin-modules . 
```
spowoduje to zbudowanie obrazu z nowymi zaktualizowanymi node_modules, które w przyszłości będą przekopiowane w momencie odpalania kontenera z aplikacją.

4. wypchnąć ten obraz na zdalne repozytorium dockera:
```
docker push jojons/ngx-admin-modules:[master/starter]
```
5. odpalić ponownie kontener

----------------------

### Demo

<a target="_blank" href="http://akveo.com/ngx-admin/">Live Demo</a>

## Documentation
This template is using [Nebular](https://github.com/akveo/nebular) modules set, [here you can find documentation and other useful articles](https://akveo.github.io/nebular/docs/guides/install-based-on-starter-kit).

### Empty starter kit
Don't need all the pages and modules and just looking for an empty starter kit for your next project? Check out our [starter-kit branch](https://github.com/akveo/ngx-admin/tree/starter-kit).

## BrowserStack
This project runs its tests on multiple desktop and mobile browsers using [BrowserStack](http://www.browserstack.com).

<img src="https://cloud.githubusercontent.com/assets/131406/22254249/534d889e-e254-11e6-8427-a759fb23b7bd.png" height="40" />

## More from Akveo

- [Eva Icons](https://github.com/akveo/eva-icons) - 480+ beautiful Open Source icons
- [Nebular](https://github.com/akveo/nebular) - Angular Components, Auth and Security
