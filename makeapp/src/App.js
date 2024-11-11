import React, { useState } from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "./component/Home/Home";
import HomeAfter from "./component/Home/HomeAfter";
import LoginPage from "./component/LogIn/LoginPage";
import MyPage from "./component/MyPage";
import SignIn from "./component/SignIn/SignIn";
import WritePost from "./component/Post/WritePost";
import MyPlant from "./component/MyPlant/MyPlant"
import './App.css';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [userId, setUserId] = useState('');

  const handleLogin = (id) => {
    setIsLoggedIn(true);
    setUserId(id);
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
    setUserId('');
  };
  
  return (
    <Router>
      <div className="App">
        <Routes>
          {/* 로그인 상태에 따라 다른 홈 화면을 보여줍니다. */}
          {isLoggedIn ? (
            <Route path="/" element={<HomeAfter onLogout={handleLogout} />} />
          ) : (
            <Route path="/" element={<Home />} />
          )}
          <Route path="/login" element={<LoginPage onLogin={handleLogin} />} />
          <Route path="/mypage" element={<MyPage userId={userId} />} />
          <Route path="/signin" element={<SignIn onLogin={handleLogin} />} />
          <Route path="/writepost" element={<WritePost userId={userId} />} />
          <Route path="/myplant" element={<MyPlant />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;