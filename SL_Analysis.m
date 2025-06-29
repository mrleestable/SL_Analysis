
% SLX file process (SLX : zip format)

unzip('model.slx', 'decompressed_slx');

% XML 파일 경로
xmlPath = fullfile('decompressed_slx', 'simulink', 'stateflow.xml');

% XML 파싱
xDoc = xmlread(xmlPath);


