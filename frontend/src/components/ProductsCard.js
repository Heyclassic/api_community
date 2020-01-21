import React, { useState } from 'react';
import { Theme, createStyles, makeStyles, useTheme } from '@material-ui/core/styles';
import CommentOutlinedIcon from '@material-ui/icons/CommentOutlined';
import Button from '@material-ui/core/Button';
import Fab from '@material-ui/core/Fab';
import {FavoriteBorderOutlined, FavoriteIcon} from '@material-ui/icons/';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import CardActions from '@material-ui/core/CardActions';
import Typography from '@material-ui/core/Typography';
import { CardActionArea } from '@material-ui/core';


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
        width: '100%'
      },
      content: {
        flex: '2 6 auto',
        width: '200%'
      },
      cover: {
        width: '100%',
        height: 'auto'
      },
      added: {

      }
    }),
  );


export default function ProductsCard({product, key, maker, comments, image, tags, votes}) {

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
          <Typography variant="subtitle2" color="textSecondary" className={classes.added}>Added on {product.attributes.added}</Typography>
            <Typography component="h6" variant="h6">
              {product.attributes.name}
            </Typography>
            <Typography variant="subtitle1" color="textSecondary">
              {maker}
            </Typography>
            <Typography>{product.attributes.description}</Typography>
            {tags.map( tag => <Typography variant="subtitle2" color="textSecondary" className="tag">{tag}</Typography>)}

          </CardContent>
          <CardActions>
            <Button size="small">
              <Typography variant="subtitle2" color="textSecondary">{comments} Comments</Typography>
            </Button>
          </CardActions>
        </div>
        <div className="like">
          <Button variant="outlined" className="like-button" minHeight="64" minWidth="68" aria-label="like">
            <FavoriteBorderOutlined fontSize="small"/>
            <Typography className="like-caption" variant="subtitle2">{votes}</Typography>
          </Button>
        </div>
      </Card>
    );
  }