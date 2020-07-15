import { useSelector } from 'react-redux';
import { useTasksActions } from 'slices/TasksSlice';

const TaskBoardContainer = (props) => {
  const { children } = props;
  const board = useSelector((state) => state.TasksSlice.board);

  const {
    loadBoard,
    loadColumnMore,
    handleCardDragEnd,
    handleTaskCreate,
    handleTaskLoad,
    handleTaskUpdate,
    handleTaskDestroy,
  } = useTasksActions();

  return children({
    board,
    loadBoard,
    loadColumnMore,
    handleCardDragEnd,
    handleTaskCreate,
    handleTaskLoad,
    handleTaskUpdate,
    handleTaskDestroy,
  });
};

export default TaskBoardContainer;
