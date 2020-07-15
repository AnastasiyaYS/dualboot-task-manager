import React from 'react';

import store from 'store';
import { Provider } from 'react-redux';

import TaskBoardContainer from 'containers/TaskBoardContainer';
import TaskBoard from 'components/TaskBoard';

const App = () => {
  return (
    <Provider store={store}>
      <TaskBoardContainer>
        {({
          board,
          loadBoard,
          loadColumnMore,
          handleCardDragEnd,
          handleTaskCreate,
          handleTaskLoad,
          handleTaskUpdate,
          handleTaskDestroy,
        }) => (
          <TaskBoard
            loadBoard={loadBoard}
            board={board}
            loadColumnMore={loadColumnMore}
            handleCardDragEnd={handleCardDragEnd}
            handleTaskCreate={handleTaskCreate}
            handleTaskLoad={handleTaskLoad}
            handleTaskUpdate={handleTaskUpdate}
            handleTaskDestroy={handleTaskDestroy}
          />
        )}
      </TaskBoardContainer>
    </Provider>
  );
};

export default App;
