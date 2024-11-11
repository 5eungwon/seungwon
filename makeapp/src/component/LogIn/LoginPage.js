import React, { useEffect, useState } from "react";
import { useNavigate, useParams, Link } from "react-router-dom";
import styles from "./LoginPage.css"

const LoginPage = (props) => {
    const [id, setId] = useState("")
    const [pw, setPw] = useState("")

    const navigate = useNavigate()

    const idChangeHandler = (e) => {
        setId(e.target.value)
    }

    const pwChangeHandler = (e) => {
        setPw(e.target.value)
    }

    function DoSignUp(e) {
        e.preventDefault()

        const data = {
            id: id,
            pw: pw
        }

        fetch('http://52.197.59.170/api/signin', {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        })
        .then(data => data.json())
        .then(res => {
            if (!res.ok) {
                alert(res.err)
            }
            else {
                alert('로그인 성공!')
                props.onLogin(res.data.id)
                navigate('/')
            }
        })
    }

    return (
        <div className="container">
            <div className = "title">
                <img src ="/IMG/title.png" style ={{height : "100%" , width : "100%"}}></img>
            </div>
            <div className="form">
                <form method="post" onSubmit={DoSignUp} id="login-form">
                    <input onChange={idChangeHandler} value={id} type="text" name="userName" placeholder="Email"></input>
                    <input onChange={pwChangeHandler} value={pw} type="password" name="userPassword" placeholder="Password"></input>
                    <input type="submit" value="Log in"></input>
                </form>
            </div>
            <div className="signin">회원이 아니신가요? &emsp;
                <Link to="/signin" className={styles.로그인버튼}>회원가입</Link>
            </div>
        </div>
    )
}

export default LoginPage;