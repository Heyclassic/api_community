/* eslint-disable no-unused-expressions */
import React, { useState, useEffect } from 'react';
import ProductsCard from './ProductsCard';
import axios from 'axios';
import Typography from '@material-ui/core/Typography';
const API_URL= "http://localhost:3000"

export default function ProductsContainer(){

  const [products, setProducts] = useState([]);
  const [makers, setMakers] = useState([]);
  const [comments, setComments] = useState([]);

  useEffect(() => {
    const fetchData = async() => {
      const response = await axios.get(API_URL);
      const attributes_array = response.data.data;
      setProducts(attributes_array);
      console.log(attributes_array);
      console.log(attributes_array[0].attributes.maker.data.attributes.name);
      console.log(attributes_array[0].attributes.comments.length);
      console.log(attributes_array[0].attributes.images_paths);
    };
    fetchData();
  }, []);

  return(
    <div>
      { products.map((product, i) =>
          <ProductsCard product={product}
                        key={product[i]}
                        maker={product.attributes.maker.data.attributes.name}
                        comments={product.attributes.comments.length}
                        image={`http://localhost:3000/product5.jpg`}
                        >
          </ProductsCard>
      )}
    </div>

  );
};