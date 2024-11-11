import React, { useState } from 'react';
import { useNavigate } from "react-router-dom";
import styles from './WritePost.module.css';

const WritePost = (props) => {
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');
    const [image, setImage] = useState('');
    const [tags, setTags] = useState('');

    const navigate = useNavigate()

    const handleSubmit = (event) => {
        event.preventDefault();

        const formData = new FormData()

        if (image) {
            formData.append('attachedImage', image)
        }

        formData.append('userId', props.userId)
        formData.append('title', title)
        formData.append('content', content)
        formData.append('tags', tags.split(',').map(tag => tag.trim()))

        fetch('http://52.197.59.170/api/post', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            alert('Posted successfully')
            navigate('/mypage')
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
    };

    return (
        <form className={styles.formContainer} onSubmit={handleSubmit}>
            <div>
                <label htmlFor="title" className={styles.label}>제목:</label>
                <input
                    type="text"
                    id="title"
                    value={title}
                    onChange={(event) => setTitle(event.target.value)}
                    className={styles.input}
                />
            </div>
            <div>
                <label htmlFor="content" className={styles.label}>내용:</label>
                <textarea
                    id="content"
                    value={content}
                    onChange={(event) => setContent(event.target.value)}
                    className={styles.textarea}
                />
            </div>
            <div>
                <label htmlFor="image" className={styles.label}>사진 삽입:</label>
                <input
                    type="file"
                    id="image"
                    accept="image/*"
                    onChange={(event) => setImage(event.target.files[0])}
                    className={styles.input}
                />
            </div>
            <div>
                <label htmlFor="tags" className={styles.label}>태그:</label>
                <input
                    type="text"
                    id="tags"
                    value={tags}
                    onChange={(event) => setTags(event.target.value)}
                    className={styles.input}
                />
            </div>
            <button type="submit" className={styles.button}>게시</button>
        </form>
    );
};

export default WritePost;
