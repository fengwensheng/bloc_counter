/*
 * @Author: Vincent Feng 
 * @Date: 2020-07-09 22:55:37 
 * @Last Modified by: Vincent Feng
 * @Last Modified time: 2020-07-09 22:56:55
 */
abstract class CounterEvent {}

class DecrementEvent extends CounterEvent {}

class IncrementEvent extends CounterEvent {}
