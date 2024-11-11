import React from 'react';
import { Link } from 'react-router-dom';
import styles from "./Home.module.css"


const Home = () => {


   return(
    <div className={styles.container}>
        <div className={styles.맨윗줄첫번째박스}></div>
        <div className={styles.맨윗줄두번째박스}>
            <div className={styles.맨윗줄두번째박스정렬} >
                <img src ="/IMG/title.png" style ={{height : "100%" , width : "100%"}}></img>
            </div>
        </div>
        <div className={styles.맨윗줄세번째박스}>
            <Link to="/login" ><button className={styles.로그인버튼}>로그인</button></Link>
            <Link to="/mypage" ><button className={styles.로그인버튼}>마이페이지</button></Link>
        </div>
        <div className={styles.두번째박스}></div>
        <div className={styles.두번째박스정렬}>
            <div className={styles.사진컨테이너}>
                <div className={styles.사진슬라이드}>
                    <a href =""><img src = "IMG/선인장.jpg" style={{height : "100%" , width:"100%"}}></img></a>
                </div>
                <div className={styles.사진슬라이드}>
                <a href =""><img src = "IMG/산세비에리아.jpg" style={{height : "100%" , width:"100%"}}></img></a>
                </div>
                <div className={styles.사진슬라이드}>
                <a href =""><img src = "IMG/알로에.jpg" style={{height : "100%" , width:"370px"}}></img></a>
                </div>
            </div>
        </div>
        <div className={styles.두번째박스정렬2}>
        <div className={styles.사진슬라이드}>
                <a href =""><img src = "IMG/산세비에리아.jpg" style={{height : "100%" , width:"370px"}}></img></a>
                </div>
        </div>

        <div className={styles.세번째박스}></div>




        
    </div>
   );

}

export default Home;