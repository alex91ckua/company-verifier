# Company Verifier

Основна ідея aпп полягає в аналізі та подальшій роботі з отриманими та відсортованими даними про компаній.

### Як це працює

В нас є деякий .csv файл зі списком компаній (кількість полів довільна і може бути в різному порядку) який ми можемо імпортувати в наш апп (файл може бути великий тому обробку потрібно робити в background). 
При обробці цього csv наша апп має проаналізувати технічну якість сайту компанії використовуючи API від GTmetrix, і якщо сайт має мало балів то ми маємо додати його в список "можливих потенційних клієнтів" і можливій подальшій відправкі рекомендацій чи пропонуванні своїх послуг. 

----------------

### Features

- звичайна автентифікація типу http_basic
- імпорт csv 
	- mapping полів завантаженого csv файлу
	- обробка великих csv файлів (background task)
	- зберігання результатів тесту gtmetrix про кожну компанію
- вибірка проаналізованих компаній по кількості балів
- можливість експорту проаналізованого списку компаній
- можливість відправити емейл пропозицію вибраним компаніям
- можливість редагування емейл шаблону