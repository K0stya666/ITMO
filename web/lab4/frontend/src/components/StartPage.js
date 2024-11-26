import React from 'react';
import Header from "./Header";
import {useNavigate} from "react-router-dom";
import MainPage from "./MainPage";
import {Link} from "@mui/material";

const StartPage = () => {

    const navigate = useNavigate();

    const handleButtonClick = (e) => {
        navigate('/main')
    }

    return (
        <div>
            <Header />
            <button onClick={handleButtonClick}>На основную</button>
        </div>
    )
}

export default StartPage;