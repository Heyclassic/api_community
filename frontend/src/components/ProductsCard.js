import React, { useState } from 'react';
import { Theme, createStyles, makeStyles, useTheme } from '@material-ui/core/styles';
import CommentOutlinedIcon from '@material-ui/icons/CommentOutlined';
import Button from '@material-ui/core/Button';
import Fab from '@material-ui/core/Fab';
import FavoriteIcon from '@material-ui/icons/Favorite';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';


const useStyles = makeStyles((theme: Theme) =>
    createStyles({
      card: {
        display: 'flex',
        width: 776,
        margin: 24,
        padding: 12,
        height: 200
      },
      details: {
        display: 'flex',
        flexDirection: 'column',
      },
      content: {
        flex: '2 6 auto',
        width: '200%'
      },
      cover: {
        width: '100%',
        height: 'auto'
      }
    }),
  );


export default function ProductsCard({product, key, maker, comments, image, tags}) {

  const classes = useStyles();
  const theme = useTheme();

    return (
      <Card className={classes.card} id={key}>
        <CardMedia
          className={classes.cover}
          image={image}
          title={product.attributes.name}
        />
        <div className={classes.details}>
          <CardContent className={classes.content}>
            <Typography component="h6" variant="h6">
              {product.attributes.name}
            </Typography>
            <Typography variant="subtitle1" color="textSecondary">
              {maker}
            </Typography>
            <Typography>{product.attributes.description}</Typography>
            {tags.map( tag => <Typography variant="subtitle2" className="tag">{tag}</Typography>)}
          </CardContent>
          <Button>
          <Typography variant="subtitle2">{comments}</Typography>
            <CommentOutlinedIcon></CommentOutlinedIcon>
          </Button>
        </div>
        <div className="like">
          <Button variant="outlined" className="like-button" minHeight="64" minWidth="68" aria-label="like">
            <FavoriteIcon fontSize="small"/>
            <Typography className="like-caption" variant="subtitle2">{product.attributes.comments.size}</Typography>
          </Button>
        </div>
      </Card>
    );
  }