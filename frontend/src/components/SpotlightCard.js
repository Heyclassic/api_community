import React from 'react';
import { Grid, Card, CardContent, Typography } from "@material-ui/core";
import { LoremIpsum } from 'react-lorem-ipsum';
import '../assets/css/spotlight.css'

class SpotlightContainer extends React.Component {

  render() {
    return(
      <div>
        <Grid container spacing={24} style={{ padding: 24 }}>
          <Grid item xs={12} sm={8}>
            <img alt="spotlight" src="http://lorempixel.com/1000/400/"/>
          </Grid>
          <Grid item xs={12} sm={4}>
            <Card className="spotlight-card">
              <CardContent>
                <Typography variant="h4">PRODUCT OF THE WEEK</Typography>
                <Typography variant="body"><LoremIpsum avgSentencesPerParagraph={5}></LoremIpsum></Typography>
              </CardContent>
            </Card>
          </Grid>
        </Grid>
      </div>
    )
  }
}
export default SpotlightContainer;