import React, { useEffect, useState } from "react";
import { useNavigate, Link } from 'react-router-dom';
import styles from "./MyPage.module.css"

const MyPage = (props) => {
    const [posts, setPosts] = useState([]);
    const [exp, setExp] = useState(0);

    const navigate = useNavigate()

    fetch('http://52.197.59.170/api/user?id=' + props.userId)
    .then(res => res.json())
    .then(res => {
        if (!res.ok) {
            alert('login first!')
            navigate('/login')
        }
        else {
            setPosts(res.data.posts)
            setExp(res.data.posts.length)
        }
    })
    .catch(err => {
        console.log(err)
    })

    return (
        <div className={styles.container}>
            <div class ={styles.첫줄첫번째박스1}></div>
            <div class ={styles.둘째줄박스1}>
                <div className={styles.프로필사진}>
                    <img src="IMG/환경 공기업 1.jpg" style={{width : "100%" ,height : "100%"}}></img>
                </div>
           </div>
           <div class ={styles.둘째줄박스2_1}>
              <div className={styles.이름}> {props.userId} </div>
            </div>
           <div class ={styles.둘째줄박스2_2}>
           {
                exp >= 10 ?(
                    <img src="/IMG/골드.webp" style={{height:"100%" , width:"30%", textAlign:'left'}}></img>
                ) : (
                    exp >= 5 ? (
                        <img src="/IMG/실버.webp" style={{height:"100%" , width:"30%",textAlign:'left'}}></img>
                    ) : (
                        <img src="/IMG/브론즈.png" style={{height:"100%" , width:"30%",textAlign:'left'}}></img>
                    )
                )
            }
           </div>
           <div class ={styles.둘째줄박스3_1}>
               <Link to="/writepost"><button className={styles.버튼}>게시글 쓰기</button></Link>
           </div>
           <div class ={styles.둘째줄박스3_2}>
               <Link to="/myplant"> <button className={styles.버튼}>나의 식물함</button></Link>
           </div>
           <div className={styles.둘째줄박스4}>

           </div>
           <div className={styles.둘째줄박스4}>
           </div>
           <div className={styles.titlename}>최근 게시물</div>
           
              
            
           <div className={styles.마지막박스}>
           {posts.map(post => (
                        <div key={post.id} className={styles.객체박스}>
                            <div className={styles.객체제목}>{post.title}</div>
                            <div className={styles.객체내용}>{post.content}</div>
                            <div className={styles.객체사진}> <img src={'http://52.197.59.170/' +post.picture} style={{width:"100%" , height :"100%"}}></img></div>
                            <div className="grayLine"></div>
                        </div>
                    ))}
           </div>
        </div>
    )
}

export default MyPage;
