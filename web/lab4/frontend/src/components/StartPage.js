import React from 'react';
import Header from "./Header";
import {useNavigate} from "react-router-dom";
import MainPage from "./MainPage";
import {Button, Link} from "@mui/material";

const StartPage = () => {

    const navigate = useNavigate();

    const handleButtonClick = () => {
        navigate('/main')
    }

    return (
        <div>
            <Header />
            <Button
                onClick={handleButtonClick}
                color="primary"
                component={Link}
                to="main"
            >На основную</Button>

        </div>
    )
}

export default StartPage;