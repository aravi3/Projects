import { connect } from 'react-redux';
import ItemDetail from './item_detail';
import { selectItem } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  console.log(state);
  return {
    item: selectItem(state, parseInt(ownProps.match.params.itemId))
  };
};


const mapDispatchToProps = (dispatch) => ({

});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail);
