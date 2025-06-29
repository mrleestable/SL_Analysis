
% SLX file process (SLX : zip format)

unzip('model.slx', 'decompressed_slx');

% XML 파일 경로
xmlPath = fullfile('decompressed_slx', 'simulink', 'stateflow.xml');

% XML 파싱
xDoc = xmlread(xmlPath);




info = Simulink.MDLInfo('model.slx');
disp(info.BlockDiagramName);
disp(info.Description);

load_system('model');
blocks = find_system('model','Type','Block');
for i = 1:length(blocks)
  blockName = get_param(blocks{i},'Name');
  blockType = get_param(blocks{i},'BlockType');
  parent = get_param(blocks{i},'Parent');
  disp([blockName,' : ', blockType, ' (Parent : ',parent,')']);
end

lines = find_system('model','FindAll','on','Type','Line');
for i = 1:length(lines)
  src = get_param(lines(i),'SrcBlockHandle');
  dst = get_param(lines(i),'DstBlockHandle');  
  srcName = get_param(src,'Name');
  dstName = get_param(dst,'Name'); 
  disp([srcName, ' -> ', dstName]);
end
