import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { selectPoke } from '../../reducers/selectors';
import { requestPoke } from '../../actions/pokemon_actions';

const mapStateToProps = state => {
  // console.log(selectPoke(state));

  return {
    poke: selectPoke(state),
    items: state.items
  };
};

const mapDispatchToProps = dispatch => ({
  requestPoke: (id) => dispatch(requestPoke(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
