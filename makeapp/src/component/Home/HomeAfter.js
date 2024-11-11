import React, { useState, useRef, useEffect } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import styles from "./Home.module.css"


const HomeAfter = (props) => {
    const timerRef = useRef()

    const [posts, setPosts] = useState([])
    const [b1, setB1] = useState(0)
    const [b2, setB2] = useState(1)

    const navigate = useNavigate()

    fetch('http://52.197.59.170/api/allpost')
    .then(res => res.json())
    .then((res) => {
        setPosts(res.data)
    })

    const Logout = (e) => {
        props.handleLogout()
        navigate('/')
    }

    const handleSlide = () => {
        console.log('slide!')
        setB1((b1 + 1) % Math.max(1, posts.length))
        setB2((b2 + 1) % Math.max(1, posts.length))
    }
    useEffect(() => {
        timerRef.current = setInterval(handleSlide, 1000)

        return () => {
            clearInterval(timerRef.current)
        }
    },[b1, b2, posts])

    return(
    <div className={styles.container}>
        <div className={styles.맨윗줄첫번째박스}></div>
        <div className={styles.맨윗줄두번째박스}>
            <div className={styles.맨윗줄두번째박스정렬} >
                <img src ="/IMG/title.png" style ={{height : "100%" , width : "100%"}}></img>
            </div>
        </div>
        <div className={styles.맨윗줄세번째박스}>
            <Link to="/login" ><button className={styles.로그인버튼}>로그아웃</button></Link>
            <Link to="/mypage" ><button className={styles.로그인버튼}>마이페이지</button></Link>
        </div>
        <div className={styles.두번째박스}></div>
        <div className={styles.두번째박스정렬}>
            <div className={styles.사진컨테이너}>
                <div className={styles.사진슬라이드}>
                    <a href =""><img src = {posts.length > 2 ? 'http://52.197.59.170/'+posts[b1].picture : 'IMG/선인장.jpg'} style={{height : "100%" , width:"100%"}}></img></a>
                </div>
            </div>
        </div>
        <div className={styles.두번째박스정렬2}>
            <div className={styles.사진슬라이드}>
                    <a href =""><img src = {posts.length > 2 ? 'http://52.197.59.170/'+posts[b2].picture : 'IMG/선인장.jpg'} style={{height : "100%" , width:"370px"}}></img></a>
                    </div>
            </div>
        <div className={styles.세번째박스}></div>
        
    </div>
   );

}

export default HomeAfter;