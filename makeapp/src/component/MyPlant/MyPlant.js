import React, { useEffect, useState } from "react";
import { useNavigate, useParams, Link } from "react-router-dom";
import styles from "./MyPlant.module.css"

const MyPlant = () => {

    const [posts, setPosts] = useState([]);

    // useEffect를 사용하여 컴포넌트가 마운트될 때 데이터를 가져옴
    useEffect(() => {
        // 서버에서 게시물 데이터를 가져오는 비동기 함수를 호출
        fetchPosts();
    }, []);

    // 서버에서 게시물 데이터를 가져오는 함수
    const fetchPosts = async () => {
        try {
            const response = await fetch('http://your-api-url/posts'); // 서버의 실제 URL을 사용해야 합니다.
            if (!response.ok) {
                throw new Error('서버에서 데이터를 가져오는 데 문제가 있습니다.');
            }
            const data = await response.json();
            setPosts(data); // 가져온 데이터를 상태에 저장
        } catch (error) {
            console.error('게시물 데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
    };

    return (
        <div className={styles.container}>
            <div className={styles.title}>
                <img src="/IMG/title.PNG" style={{ height: "50%", width: "50%" }}></img>
            </div>
            <div className={styles.subcontainer}>
                <div className={styles.imgcontainer}>
                    <div className={styles.plantimg}>
                        <img src="/IMG/treepixel.png" style={{ width: "100%", height: "100%" }}></img>
                    </div>
                    <div className={styles.plantname}>식물 이름 1/2</div>
                </div>
                <div className={styles.postcontainer}>
                    {posts.map(post => (
                        <div key={post.id}>
                            <div className={styles.posttitle}>{post.title}</div>
                            <div className={styles.postcontent}>{post.content}</div>
                            <img className={styles.postpic} src={'http://52.197.59.170/' +post.picture} width = {100} height={100}></img>
                            <div className="grayLine"></div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default MyPlant;