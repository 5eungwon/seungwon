import React from 'react';
import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import styles from "./SignIn.css"

const SignIn = (props) => {
    const [id, setId] = useState("")
    const [pw, setPw] = useState("")
    const [Passwordrewrite, setPasswordrewrite] = useState("")

    const navigate = useNavigate()

    const idChangeHandler = (e) => {
        setId(e.target.value)
    }

    const pwChangeHandler = (e) => {
        setPw(e.target.value)
    }

    const PasswordrewriteChangeHandler = (e) => {
        setPasswordrewrite(e.target.value)
    }

    function DoSignIn(e) {
        e.preventDefault()

        const data = {
            id: id,
            pw: pw,
            Passwordrewrite: Passwordrewrite
        }

        fetch('http://52.197.59.170/api/signup', {
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
                alert('회원가입 성공!')
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
                <form method="post" onSubmit={DoSignIn} action="http://52.197.59.170/api/signup" id="login-form">
                    <input onChange={idChangeHandler} value={id} type="text" name="id" placeholder="Email"></input>
                    <input onChange={pwChangeHandler} value={pw} type="password" name="pw" placeholder="Password"></input>
                    <input onChange={PasswordrewriteChangeHandler} value={Passwordrewrite} type="passwordre" name="Passwordrewrite" placeholder="Password rewrite"></input>
                    <input type="submit" value="Sign In"></input>
                </form>
            </div>
        </div>
    )
}

export default SignIn;