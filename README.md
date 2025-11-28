Готовое решение для профильного задания на стажировку Ruby on Rails Developer.

## Функциональность
- Создание студента (POST /students)
- Удаление студента по токену (DELETE /students/:id)
- Получение списка классов школы
- Получение списка студентов класса

## Запуск проекта

```bash
docker compose up --build
```
## Примеры запросов
Создать студента

POST http://localhost:3000/students

{
  "student": {
    "first_name": "Иван",
    "last_name": "Иванович",
    "surname": "Пупкин",
    "class_id": 1,
    "school_id": 10
  }
}

Удалить студента

DELETE http://localhost:3000/students/3

Headers:

Authorization: Bearer <TOKEN>
