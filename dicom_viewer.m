function dicom_viewer()
    [volume, spacing] = load_dicom_series();          % загрузка данных и spacing
    volume_lowres = imresize3(volume, 0.4);           % уменьшение объема для 3D
    show_slice_slider(volume);                        % просмотр слайсов
    show_3d_volume(volume_lowres, spacing);           % 3D визуализация
end

function [volume, spacing] = load_dicom_series()
    folder = uigetdir('', 'Выберите папку с DICOM-срезами');
    if folder == 0
        error('Папка не выбрана');
    end

    files = dir(fullfile(folder, '*.dcm'));
    if isempty(files)
        error('Нет DICOM файлов в папке');
    end

    try
        infos = arrayfun(@(f) dicominfo(fullfile(folder, f.name)), files);
        [~, idx] = sort([infos.InstanceNumber]);
        files = files(idx);
    catch
        files = sort_nat({files.name});
    end

    for i = 1:length(files)
        if isstruct(files(i))
            fname = fullfile(folder, files(i).name);
        else
            fname = fullfile(folder, files{i});
        end
        volume(:,:,i) = dicomread(fname);
    end
    volume = double(volume);

    % Получение spacing
    info = dicominfo(fullfile(folder, files(1).name));
    px_spacing = info.PixelSpacing;           % [dy dx]
    try
        dz = info.SpacingBetweenSlices;
    catch
        dz = info.SliceThickness;
    end
    spacing = [px_spacing(2), px_spacing(1), dz];  % [dx dy dz]
end

function show_slice_slider(volume)
    figure('Name', 'DICOM Slice Viewer');
    ax = axes('Units', 'pixels', 'Position', [50 60 512 512]);
    img = imshow(volume(:,:,1), []);
    title(ax, sprintf('Slice %d', 1));

    uicontrol('Style', 'slider',...
        'Min', 1, 'Max', size(volume,3), 'Value', 1,...
        'SliderStep', [1/(size(volume,3)-1) , 10/(size(volume,3)-1)],...
        'Position', [150 20 300 20],...
        'Callback', @(src,~) update_slice(round(src.Value)));

    function update_slice(idx)
        img.CData = volume(:,:,idx);
        title(ax, sprintf('Slice %d', idx));
    end
end

function show_3d_volume(volume, spacing)
    volume = volume - min(volume(:));
    volume = volume / max(volume(:));

    fig = figure('Name', '3D Volume Rendering with Threshold', 'NumberTitle', 'off', ...
                 'Position', [300, 300, 800, 600]);

    ax = axes('Parent', fig, 'Position', [0.1 0.2 0.8 0.75]);
    
    defaultThreshold = 0.4;
    p = renderIso(volume, defaultThreshold, ax, spacing);

    uicontrol('Style', 'text', 'Parent', fig, ...
              'String', 'Threshold:', ...
              'Position', [350, 45, 100, 20]);

    uicontrol('Style', 'slider', 'Parent', fig, ...
              'Min', 0.01, 'Max', 1, 'Value', defaultThreshold, ...
              'SliderStep', [0.01 0.1], ...
              'Position', [250, 20, 300, 20], ...
              'Callback', @(src, ~) updateIso(volume, src.Value, ax, p, spacing));
end

function p = renderIso(volume, threshold, ax, spacing)
    [dx, dy, dz] = deal(spacing(1), spacing(2), spacing(3));
    [X, Y, Z] = meshgrid( ...
        (0:size(volume,2)-1)*dx, ...
        (0:size(volume,1)-1)*dy, ...
        (0:size(volume,3)-1)*dz );

    cla(ax);
    p = patch(ax, isosurface(X, Y, Z, volume, threshold));
    isonormals(X, Y, Z, volume, p);
    set(p, 'FaceColor', [0.7 0.2 0.2], 'EdgeColor', 'none');
    daspect(ax, [1 1 1]);
    view(ax, 3);
    camlight(ax);
    lighting(ax, 'gouraud');
    axis(ax, 'tight');
end

function updateIso(volume, threshold, ax, p, spacing)
    delete(p);
    renderIso(volume, threshold, ax, spacing);
end
