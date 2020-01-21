import React from 'react';

import { Button, Card, CardContent, CardActionArea, CardActions, Typography, CardMedia } from "@material-ui/core";
import { LoremIpsum } from 'react-lorem-ipsum';
import '../assets/css/news.css';

class NewsContainer extends React.Component {

  render() {
    return(
      <div>
        <Card className="news-card">
          <CardActionArea>
            <CardMedia component="img" alt="" height="140" image="https://lorempixel.com/150/100" ></CardMedia>
            <CardContent>
              <Typography variant="body1" color="textSecondary" component="p">
                <LoremIpsum avgSentencesPerParagraph={1}></LoremIpsum>
              </Typography>
            </CardContent>
          </CardActionArea>
          <CardActions>
            <Button size="small" color="primary">More</Button>
          </CardActions>
        </Card>
      </div>
    )
  }
}

export default NewsContainer;