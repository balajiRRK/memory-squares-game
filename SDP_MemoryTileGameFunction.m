function board_display = SDP_MemoryTileGameFunction(list, memoryTileGame_scene)

% This function correlates the random values stored in the 2d array list
% and converts them into the proper coordinate values for SimpleGameEngine
% to understand by storing the coordinate values in board_display and
% then drawing those tiles given by the coordinates into the screen for the
% user to see

    for i = 1:size(list, 1)
        if list(i, 1) == 1 && list(i, 2) == 1 % list(i, 1) represents random
            board_display = [2, 1; 1, 1];
        elseif list(i, 1) == 1 && list(i, 2) == 2 % list(i, 2) represents random2
            board_display = [1, 3; 1, 1];
        elseif list(i, 1) == 2 && list(i, 2) == 1
            board_display = [1, 1; 4, 1];
        elseif list(i, 1) == 2 && list(i, 2) == 2
            board_display = [1, 1; 1, 5];
        end
        
        % Displays tile to memorize and click when the game starts
        drawScene(memoryTileGame_scene, board_display);
        title("Memory Tile Game");
        pause(1.5)
    end
end