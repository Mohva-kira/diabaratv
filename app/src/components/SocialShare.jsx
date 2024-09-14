// File: src/components/SocialShare.js

import React from 'react';
import PropTypes from 'prop-types';
import {
    FacebookShareButton,
    TwitterShareButton,
    LinkedinShareButton,
    FacebookIcon,
    TwitterIcon,
    LinkedinIcon
} from 'react-share';
import styled from 'styled-components';
import { Helmet } from 'react-helmet';

const ShareContainer = styled.div`
  display: flex;
  justify-content: center;
  gap: 10px;
`;

const SocialShare = ({ url, image, title, description }) => (

    <>
        {console.log('images !!!', image)}
        <Helmet>
            <meta property="og:title" content={title} />
            <meta property="og:description" content={description} />
            <meta property="og:image" content={image} />
            <meta property="og:url" content={url} />

            <meta name="twitter:card" content="summary_large_image" />
            <meta name="twitter:title" content={title} />
            <meta name="twitter:description" content={description} />
            <meta name="twitter:image" content={image} />
        </Helmet>
        <ShareContainer>
            <FacebookShareButton url={url} quote={description} hashtag="#example">
                <FacebookIcon size={32} round />
            </FacebookShareButton>
            <TwitterShareButton url={url} title={description} via="your_twitter_handle" hashtags={['example']}>
                <TwitterIcon size={32} round />
            </TwitterShareButton>
            <LinkedinShareButton url={url} title={title} summary={description} source="example.com">
                <LinkedinIcon size={32} round />
            </LinkedinShareButton>
        </ShareContainer>
    </>
);

SocialShare.propTypes = {
    url: PropTypes.string.isRequired,
    image: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
};

export default SocialShare;
