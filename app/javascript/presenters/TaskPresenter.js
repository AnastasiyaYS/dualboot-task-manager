import PropTypes from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';

export default new PropTypesPresenter(
  {
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
    author: PropTypes.object.isRequired,
    assignee: PropTypes.object,
    state: PropTypes.string.isRequired,
    imageUrl: PropTypes.string,
  },
  {},
);
