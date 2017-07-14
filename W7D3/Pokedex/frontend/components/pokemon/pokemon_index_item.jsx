import React from 'react';
import { Link } from 'react-router-dom';

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const poke = this.props.poke;
    const path = `/pokemon/${poke.id}`;
    return (
      <div>
        <Link to={path}>
          {poke.name}
        </Link>
        <img src={poke.image_url}></img>
      </div>
    );
  }
}

export default PokemonIndexItem;
