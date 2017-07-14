import React from 'react';
import ItemDetailContainer from '../items/item_detail_container';
import { Route, Link } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
    // console.log(this.props);
  }

  componentDidMount() {
    const pokeId = this.props.match.params.pokeId;
    this.props.requestPoke(pokeId);
  }

  componentWillReceiveProps(newProps) {
    const newPokeID = newProps.match.params.pokeId;
    const oldPokeID = this.props.match.params.pokeId;
    if (newPokeID !== oldPokeID) {
      this.props.requestPoke(newPokeID);
    }
  }

  render() {
    let poke = this.props.poke;
    let items = this.props.items.map((item, idx) => (
        <li key={idx} >
          <Link to={`/pokemon/${poke.id}/item/${item.id}`}>
          {item.name}
          </Link>
        </li>
    ));

    return (
      <div>
        <h3>{ poke ? poke.name : "loading" }</h3>
        <ul>
          {items}
        </ul>
        <Route path="/pokemon/:pokeId/item/:itemId"
          component={ItemDetailContainer} />
      </div>
    );
  }
}

export default PokemonDetail;
