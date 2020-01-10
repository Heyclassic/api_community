import React from 'react';
import NavBar from './components/NavBar';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import SpotlightCard from './components/SpotlightCard';
import ProductsCard from './components/ProductsCard';
import ProductsContainer from './components/ProductsContainer';
import NewsCard from './components/NewsCard';
import StickyFooter from './components/StickyFooter';
import './assets/css/app.css';

function App() {
  return (
    <div className="App">
      <NavBar></NavBar>
      <SpotlightCard></SpotlightCard>
      <Grid container spacing={1}>
        <Grid item lg="7" sm="12" xs="12">
          <Typography className="products" variant="h4">Latest Products</Typography>
          <ProductsContainer></ProductsContainer>
        </Grid>
        <Grid item lg="4" sm="12" xs="12" className="news-grid" >
          <Typography className="news" variant="h4">News</Typography>
          <NewsCard></NewsCard>
        </Grid>
      </Grid>
      <StickyFooter></StickyFooter>
    </div>
  );
}

export default App;
