import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MatrixCalculatorApp());
}

class MatrixCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Matrixx(),
    );
  }
}
class Matrixx extends StatefulWidget {
  @override
  _MatrixxState createState() => _MatrixxState();
}
class _MatrixxState extends State<Matrixx> {
  final TextEditingController _nMatricesController = TextEditingController();
  final TextEditingController _operationController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final List<List<List<int>>> _matrices = [];
  String _selectedOperation = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix Calculator'),
        backgroundColor: Colors.red,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nMatricesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter the number of matrices'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedOperation,
                    items: <String>['+', '-', '*'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOperation = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Operation',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {

                    int nMatrices = int.tryParse(_nMatricesController.text) ?? 0;
                    List<List<List<int>>> matrices = [];

                    for (int i = 0; i < nMatrices; i++) {
                      matrices.add(createMatrix());
                    }

                    _matrices.clear();
                    _matrices.addAll(matrices);

                    switch (_selectedOperation) {
                      case '+':
                        performAddition();
                        break;
                      case '-':
                        performSubtraction();
                        break;
                      case '*':
                        performMultiplication();
                        break;
                      default:
                        _resultController.text = 'Invalid operation!';
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Calculate'),

                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_matrices.isEmpty) {
                  _resultController.text = 'No matrices entered';
                  return;
                }
                _resultController.text = '';
                for (int i = 0; i < _matrices.length; i++) {
                  _resultController.text += 'Matrix ${i + 1}:\n';
                  for (int j = _matrices[i].length - 1; j >= 0; j--) {
                    _resultController.text += _matrices[i][j].join(' ') + '\n';
                  }
                  _resultController.text += '\n';
                }
                _resultController.text += '\nResult:\n';
                calculateResult();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text('Show Matrices & Result'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller: _resultController,
                  enabled: false,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Show Matrices & Result',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(  borderSide: BorderSide(color: Colors.black),),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  List<List<int>> createMatrix() {
    List<List<int>> matrix = [];
    int? rows, cols;

    // Display dialog for rows and columns input
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter matrix dimensions'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter the number of rows'),
                onChanged: (value) {
                  rows = int.tryParse(value);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter the number of columns'),
                onChanged: (value) {
                  cols = int.tryParse(value);
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    ).then((_) {
      // Create matrix based on dialog input
      if (rows != null && cols != null) {
        for (int i = 0; i < rows!; i++) {
          matrix.add([]);
          for (int j = 0; j < cols!; j++) {
            // Display dialog for each matrix element input
            showDialog(
              context: context,
              builder: (BuildContext context) {
                int? element;
                return AlertDialog(
                  title: Text('Enter matrix element ($i, $j)'),
                  content: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      element = int.tryParse(value);
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (element != null) {
                          matrix[i].add(element!);
                        }
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    }).then((_) {
      // Print the created matrix for debugging
      print(matrix);
    });

    return matrix;
  }

  void performAddition() {
    List<List<int>> result = List.from(_matrices[0]);

    for (int i = 1; i < _matrices.length; i++) {
      if (_matrices[i].length != result.length || _matrices[i][0].length != result[0].length) {
        _resultController.text = 'Error: Matrices must have the same dimensions for addition';
        return;
      }
      for (int row = 0; row < result.length; row++) {
        for (int col = 0; col < result[0].length; col++) {
          result[row][col] += _matrices[i][row][col];
        }
      }
    }

    _resultController.text += 'Result of addition:\n';
    for (int i = 0; i < result.length; i++) {
      _resultController.text += result[i].join(' ') + '\n';
    }
  }

  void performSubtraction() {
    List<List<int>> result = List.from(_matrices[0]);

    for (int i = 1; i < _matrices.length; i++) {
      if (_matrices[i].length != result.length || _matrices[i][0].length != result[0].length) {
        _resultController.text = 'Error: Matrices must have the same dimensions for subtraction';
        return;
      }
      for (int row = 0; row < result.length; row++) {
        for (int col = 0; col < result[0].length; col++) {
          result[row][col] -= _matrices[i][row][col];
        }
      }
    }

    _resultController.text += 'Result of subtraction:\n';
    for (int i = 0; i < result.length; i++) {
      _resultController.text += result[i].join(' ') + '\n';
    }
  }

  void performMultiplication() {
    if (_matrices.length < 2) {
      _resultController.text = 'Error: Multiplication requires at least two matrices';
      return;
    }

    List<List<int>> result = List.from(_matrices[0]);

    for (int i = 1; i < _matrices.length; i++) {
      if (result[0].length != _matrices[i].length || result.isEmpty || _matrices[i].isEmpty) {
        _resultController.text = 'Error: Matrices dimensions are not compatible for multiplication';
        return;
      }
      result = multiplyMatrices(result, _matrices[i]);
    }

    if (result.isEmpty) {
      _resultController.text = 'Error';
      return;
    }

    _resultController.text += 'Result of multiplication:\n';
    for (int i = 0; i < result.length; i++) {
      _resultController.text += result[i].join(' ') + '\n';
    }
  }

  List<List<int>> multiplyMatrices(List<List<int>> matrix1, List<List<int>> matrix2) {
    int rows1 = matrix1.length;
    int cols1 = matrix1[0].length;
    int rows2 = matrix2.length;
    int cols2 = matrix2[0].length;

    if (cols1 != rows2 || rows1 == 0 || cols1 == 0 || cols2 == 0) {
      return [[]]; // Return an empty matrix to indicate an error
    }

    List<List<int>> result = List.generate(rows1, (index) => List.filled(cols2, 0));
    for (int i = 0; i < rows1; i++) {
      for (int j = 0; j < cols2; j++) {
        for (int k = 0; k < cols1; k++) {
          result[i][j] += matrix1[i][k] * matrix2[k][j];
        }
      }
    }
    return result;
  }

  void calculateResult() {
    switch (_selectedOperation) {
      case '+':
        performAddition();
        break;
      case '-':
        performSubtraction();
        break;
      case '*':
        performMultiplication();
        break;
      default:
        _resultController.text = 'Invalid operation!';
    }
  }
}
