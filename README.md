# Flutter Task Manager App

## Decisions

1. **Architecture:**
    - Followed Clean Architecture principles to ensure a well-structured and maintainable codebase.
    - Separated the application into three main layers: Presentation, Domain, and Data.

2. **State Management:**
    - Used Riverpod for state management to ensure the application state is handled efficiently and the UI reacts appropriately to state changes.

3. **Local Storage:**
    - Utilized `shared_preferences` for local storage to save and retrieve tasks, ensuring data persistence across app launches.

4. **Dependency Injection:**
    - Implemented providers using Riverpod to manage dependencies and allow easy testing and scalability.

## Assumptions

1. **Task Model:**
    - Assumed tasks only require an ID and a title for simplicity. Additional attributes can be added as needed.

2. **Task Management:**
    - Assumed basic CRUD operations (Create, Read, Update, Delete) for tasks.
    - Implemented mock/in-memory database for demonstration purposes.

3. **UI Design:**
    - Focused on functionality over aesthetics due to time constraints. The UI is kept simple and functional.

4. **Testing:**
    - Included unit tests for the Riverpod state management and use cases.
    - Assumed basic knowledge of Flutter testing framework.

## Project Structure

```plaintext
📁 task_manager
┣ 📁 lib
┃ ┣ 📁 data
┃ ┃ ┣ 📁 repositories
┃ ┃ ┃ ┣ 📄 task_repository_impl.dart
┃ ┃ ┣ 📄 task_data_source.dart
┃ ┣ 📁 domain
┃ ┃ ┣ 📁 entities
┃ ┃ ┃ ┣ 📄 task.dart
┃ ┃ ┣ 📁 repositories
┃ ┃ ┃ ┣ 📄 task_repository.dart
┃ ┣ 📁 presentation
┃ ┃ ┣ 📁 pages
┃ ┃ ┃ ┣ 📄 home_page.dart
┃ ┃ ┣ 📁 providers
┃ ┃ ┃ ┣ 📄 task_provider.dart
┃ ┃ ┣ 📁 widgets
┃ ┃ ┃ ┣ 📄 task_form.dart
┃ ┃ ┃ ┣ 📄 task_list.dart
┃ ┣ 📄 main.dart
┣ 📄 pubspec.yaml
