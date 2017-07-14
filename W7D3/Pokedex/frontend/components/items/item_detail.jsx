import React from 'react';

const ItemDetail = ({ item }) => {
  console.log(item);
  let attributes;
  if (!item) {
    attributes = 'Loading';
  } else {
    attributes = Object.values(item).map((attr, idx) =>
      <li key={idx}>{attr}</li>);
  }
  return (
    <div>
      <ul>
        { attributes }
      </ul>
    </div>
  );
};

export default ItemDetail;
