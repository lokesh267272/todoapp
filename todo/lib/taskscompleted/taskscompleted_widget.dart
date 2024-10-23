import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/addtask_widget.dart';
import '/components/task_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'taskscompleted_model.dart';
export 'taskscompleted_model.dart';

class TaskscompletedWidget extends StatefulWidget {
  const TaskscompletedWidget({super.key});

  @override
  State<TaskscompletedWidget> createState() => _TaskscompletedWidgetState();
}

class _TaskscompletedWidgetState extends State<TaskscompletedWidget> {
  late TaskscompletedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskscompletedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const AddtaskWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: Colors.white,
          elevation: 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.black,
              size: 24.0,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400.0,
              ),
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Completed',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: StreamBuilder<List<TasksRecord>>(
                          stream: queryTasksRecord(
                            queryBuilder: (tasksRecord) => tasksRecord
                                .where(
                                  'users',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'completed',
                                  isEqualTo: true,
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TasksRecord> listViewTasksRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewTasksRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewTasksRecord =
                                    listViewTasksRecordList[listViewIndex];
                                return TaskWidget(
                                  key: Key(
                                      'Keyvlv_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                                  taskDoc: listViewTasksRecord,
                                  checkBoxAction: () async {
                                    await listViewTasksRecord.reference
                                        .update(createTasksRecordData(
                                      completed: false,
                                    ));
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
