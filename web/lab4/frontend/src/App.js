import './styles/App.css';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import MainPage from "./components/MainPage";

function App() {

  return (
      <Router>
          <Routes>

              {/* Перенаправление с корневого пути на /main */}
              <Route path="/" element={<Navigate to={'/main'} replace={true} />} />

              {/* Главная страница */}
              <Route path="/main" element={<MainPage />} />

              {/* Маршрут для несуществующих страниц (404) */}
              <Route path="*" element={<h1>404 - Страница Не Найдена</h1>} />

          </Routes>
      </Router>
    );
}

export default App;
