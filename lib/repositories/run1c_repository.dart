import 'package:mtwin_1c_app/entities/analytics/analytcs_row_13.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_15.dart';
import 'package:mtwin_1c_app/entities/analytics/analytcs_row_17.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row1218.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_1.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_14.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_16.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_2.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_4.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_7.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_8.dart';
import 'package:mtwin_1c_app/entities/analytics/analytics_row_9.dart';
import 'package:mtwin_1c_app/entities/run1c/query_types_1c.dart';
import 'dart:io';
import 'dart:convert';

class Run1cRepository {
  List<QueryType1C> initializeQueryList() {
    final List<QueryType1C> querytypes = [
      QueryType1C(
          id: 1,
          name:
              "Проценты по договорам, открытым до этого периода и действующим на конец периода",
          comment: "(без частичного погашения)"),
      QueryType1C(
          id: 2,
          name:
              "Проценты по договорам в этом периоде - закрытым в этом периоде заемщиком",
          comment: '(выкуп)'),
      QueryType1C(
          id: 3,
          name: "Проценты по договорам, открытым и закрытым день в день",
          comment: ''),
      QueryType1C(
          id: 4,
          name:
              "Проценты по договорам, открытым в этом периоде - и действующим (не закрытым) на конец периода",
          comment: ''),
      QueryType1C(
          id: 5,
          name:
              "Проценты по договорам, открытым в последний день периода - и действующим (не закрытым) на конец периода",
          comment: ''),
      QueryType1C(
          id: 6,
          name:
              "Проценты по договорам, открытым до этого периода и закрытым в этом периоде заемщиком",
          comment: '(выкуп)'),
      QueryType1C(
          id: 7,
          name:
              "Проценты по договорам, открытым до этого периода и закрытым полной продажей залога (лота)",
          comment: ''),
      QueryType1C(
          id: 8,
          name: "Проценты по договорам, открытым до этого периода и закрытым",
          comment: 'частичной продажей вещей'),
      QueryType1C(
          id: 9,
          name:
              "Проценты по договорам, открытым до этого периода и действующим на конец периода",
          comment: 'с частичной продажей вещей'),
      QueryType1C(
          id: 10,
          name:
              "Проценты по договорам, открытым до этого периода и частично погашенным до этого периода",
          comment:
              '(Сумма займа 0 на начале периода и долг только по процентам)'),
      QueryType1C(
          id: 11,
          name:
              "Проценты по договорам, открытым до этого периода и полностью погашенным до этого периода (? займа 0, %% 0) - и не закрытым на конец периода",
          comment: '(на остатке вещь)'),
      QueryType1C(id: 12, name: "Открытия", comment: ''),
      QueryType1C(id: 13, name: "Закрытия полной продажей", comment: ''),
      QueryType1C(id: 14, name: "Закрытия самим заёмщиком", comment: '(выкуп)'),
      QueryType1C(
          id: 15,
          name: "Продажи частичные",
          comment: '(для закрытых в этом периоде)'),
      QueryType1C(
          id: 16,
          name: "Продажи частичные",
          comment: '(для закрытых в этом периоде с убытком)'),
      QueryType1C(
          id: 17,
          name: "Продажи частичные",
          comment: '(для не закрытых в этом периоде)'),
      QueryType1C(id: 18, name: "Открытия", comment: '(однодневки)'),
    ];
    return querytypes;
  }

  Future<bool> do12(
      List<AnalyticsRow1218> ticketOpeningList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketOpeningList) {
        var currentElement = e;
        Map<String, dynamic> newItemCust = {};
        newItemCust['MsgId'] = ++cnt;
        newItemCust['MsgType'] = 'Client';
        Map<String, dynamic> newItemCustContent = {};
        newItemCustContent['ID'] = currentElement.customerId;
        newItemCustContent['LastName'] = currentElement.customerInfo.lastName;
        newItemCustContent['FirstName'] = currentElement.customerInfo.firstName;
        newItemCustContent['Patronymic'] =
            currentElement.customerInfo.patronymic;
        newItemCustContent['Sex'] = currentElement.customerInfo.sex;
        newItemCustContent['BirthDate'] = currentElement.customerInfo.birthDate;
        newItemCustContent['BirthPlace'] =
            currentElement.customerInfo.birthPlace;
        newItemCustContent['CitizenCountryCode'] =
            currentElement.customerInfo.citizenCountryCode;
        newItemCust['MsgData'] = newItemCustContent;
        toReturn.add(newItemCust);

        Map<String, dynamic> newItemSecuredLoanAgreement = {};
        newItemSecuredLoanAgreement['MsgType'] = 'SecuredLoanAgreement';
        newItemSecuredLoanAgreement['MsgId'] = ++cnt;
        Map<String, dynamic> newItemSecuredLoanAgreementContent = {};
        newItemSecuredLoanAgreementContent['ID'] = currentElement.ticketId;
        newItemSecuredLoanAgreementContent['Num'] = currentElement.ticketNumber;
        newItemSecuredLoanAgreementContent['Dept'] = currentElement.dept;
        newItemSecuredLoanAgreementContent['Client'] =
            currentElement.customerId;
        newItemSecuredLoanAgreementContent['PaymentSchedule'] =
            currentElement.ticketId;
        newItemSecuredLoanAgreementContent['Date'] = currentElement.beginDate;
        newItemSecuredLoanAgreementContent['Amount'] = currentElement.amount;
        newItemSecuredLoanAgreementContent['BeginDate'] =
            currentElement.beginDate;
        newItemSecuredLoanAgreementContent['EndDate'] = currentElement.endDate;
        newItemSecuredLoanAgreementContent['FinancialProduct'] =
            currentElement.pawnType;
        newItemSecuredLoanAgreementContent['LoanMethod'] = 'Direct';
        newItemSecuredLoanAgreementContent['RussianResident'] =
            currentElement.customerInfo.isResident;
        newItemSecuredLoanAgreement['MsgData'] =
            newItemSecuredLoanAgreementContent;
        toReturn.add(newItemSecuredLoanAgreement);

        Map<String, dynamic> newItemLoanerPawnAgreement = {};
        newItemLoanerPawnAgreement['MsgType'] = 'LoanerPawnAgreement';
        newItemLoanerPawnAgreement['MsgId'] = ++cnt;
        Map<String, dynamic> newItemLoanerPawnAgreementContent = {};
        newItemLoanerPawnAgreementContent['ID'] = currentElement.ticketId;
        newItemLoanerPawnAgreementContent['Client'] = currentElement.customerId;
        newItemLoanerPawnAgreementContent['Loan'] = currentElement.ticketId;
        newItemLoanerPawnAgreementContent['Dept'] = currentElement.dept;
        newItemLoanerPawnAgreementContent['Num'] = currentElement.ticketNumber;
        newItemLoanerPawnAgreementContent['Date'] = currentElement.beginDate;
        newItemLoanerPawnAgreementContent['BeginDate'] =
            currentElement.beginDate;
        newItemLoanerPawnAgreementContent['EndDate'] = currentElement.endDate;
        newItemLoanerPawnAgreementContent['SellingBeginDate'] =
            currentElement.sellingBeginDate;
        newItemLoanerPawnAgreementContent['PawnType'] = currentElement.pawnType;
        List<Map<String, dynamic>> pawnObjects = [];

        for (final currentObject in currentElement.ticketObjectList) {
          Map<String, dynamic> newItemPawnObject = {};
          newItemPawnObject['ID'] = currentObject.ticketObjectId;
          newItemPawnObject['Amount'] = currentObject.amount;
          pawnObjects.add(newItemPawnObject);
        }
        newItemLoanerPawnAgreementContent['PawnObjects'] = pawnObjects;
        newItemLoanerPawnAgreement['MsgData'] =
            newItemLoanerPawnAgreementContent;
        toReturn.add(newItemLoanerPawnAgreement);

        Map<String, dynamic> newItemPaymentSchedule = {};
        newItemPaymentSchedule['MsgType'] = 'PaymentSchedule';
        newItemPaymentSchedule['MsgId'] = ++cnt;
        Map<String, dynamic> newItemPaymentScheduleContent = {};
        newItemPaymentScheduleContent['ID'] = currentElement.ticketId;
        newItemPaymentScheduleContent['Date'] = currentElement.beginDate;
        newItemPaymentScheduleContent['scheduleNumber'] = 1;
        newItemPaymentScheduleContent['Dept'] = currentElement.dept;
        newItemPaymentScheduleContent['Client'] = currentElement.customerId;
        newItemPaymentScheduleContent['Loan'] = currentElement.ticketId;
        newItemPaymentScheduleContent['IsPrimary'] = true;
        newItemPaymentScheduleContent['TrueInterestCost'] =
            currentElement.trueInterestCost;

        List<Map<String, dynamic>> paymentTable = [];

        Map<String, dynamic> newItemPaymentTableStep1 = {};
        newItemPaymentTableStep1['date'] = currentElement.beginDate;
        newItemPaymentTableStep1['PaymentType'] = "УвеличениеОсновногоДолга";
        newItemPaymentTableStep1['beginDate'] = currentElement.beginDate;
        newItemPaymentTableStep1['endDate'] = currentElement.endDate;
        newItemPaymentTableStep1['accBegin'] = currentElement.accBegin;
        newItemPaymentTableStep1['accEnd'] = currentElement.accEnd;
        newItemPaymentTableStep1['sum'] = currentElement.amount;
        paymentTable.add(newItemPaymentTableStep1);

        Map<String, dynamic> newItemPaymentTableStep2 = {};
        newItemPaymentTableStep2['date'] = currentElement.endDate;
        newItemPaymentTableStep2['PaymentType'] = "ПогашениеОсновногоДолга";
        newItemPaymentTableStep2['beginDate'] = currentElement.beginDate;
        newItemPaymentTableStep2['endDate'] = currentElement.endDate;
        newItemPaymentTableStep2['accBegin'] = currentElement.accBegin;
        newItemPaymentTableStep2['accEnd'] = currentElement.accEnd;
        newItemPaymentTableStep2['sum'] = currentElement.amount;
        paymentTable.add(newItemPaymentTableStep2);

        Map<String, dynamic> newItemPaymentTableStep3 = {};
        newItemPaymentTableStep3['date'] = currentElement.endDate;
        newItemPaymentTableStep3['PaymentType'] = "НачислениеПроцентов";
        newItemPaymentTableStep3['beginDate'] = currentElement.beginDate;
        newItemPaymentTableStep3['endDate'] = currentElement.endDate;
        newItemPaymentTableStep3['accBegin'] = currentElement.accBegin;
        newItemPaymentTableStep3['accEnd'] = currentElement.accEnd;
        newItemPaymentTableStep3['sum'] = currentElement.sumUplatCorrect;
        paymentTable.add(newItemPaymentTableStep3);

        newItemPaymentScheduleContent['PaymentTable'] = paymentTable;
        newItemPaymentSchedule['MsgData'] = newItemPaymentScheduleContent;
        toReturn.add(newItemPaymentSchedule);

        Map<String, dynamic> newItemIssue = {};
        newItemIssue['MsgType'] = 'Issue';
        newItemIssue['MsgId'] = ++cnt;
        Map<String, dynamic> newItemIssueContent = {};
        newItemIssueContent['ID'] = currentElement.ticketId;
        newItemIssueContent['Dept'] = currentElement.dept;
        newItemIssueContent['Client'] = currentElement.customerId;
        newItemIssueContent['Loan'] = currentElement.ticketId;
        newItemIssueContent['Date'] = currentElement.beginDate;
        newItemIssueContent['Amount'] = currentElement.amount;
        newItemIssueContent['paymentForm'] = currentElement.dept;
        newItemIssueContent['PaymentDate'] = currentElement.beginDate;
        newItemIssue['MsgData'] = newItemIssueContent;
        toReturn.add(newItemIssue);

        for (final currentObject in currentElement.ticketObjectList) {
          Map<String, dynamic> newItemLoanerPawnObject = {};
          newItemLoanerPawnObject['MsgType'] = 'LoanerPawnObject';
          newItemLoanerPawnObject['MsgId'] = ++cnt;
          Map<String, dynamic> newItemLoanerPawnObjectContent = {};
          newItemLoanerPawnObjectContent['ID'] = currentObject.ticketObjectId;
          newItemLoanerPawnObjectContent['Name'] = currentObject.name;
          newItemLoanerPawnObjectContent['PawnObjectType'] =
              currentElement.pawnType;
          newItemLoanerPawnObjectContent['Client'] = currentElement.customerId;
          newItemLoanerPawnObject['MsgData'] = newItemLoanerPawnObjectContent;
          toReturn.add(newItemLoanerPawnObject);
        }
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do1(List<AnalyticsRow1> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'InterestCalculation';
        Map<String, dynamic> interestCalculationContent = {};
        interestCalculationContent['ID'] = currentElement.id;
        interestCalculationContent['Dept'] = currentElement.dept;
        interestCalculationContent['Date'] = currentElement.soldDate;
        interestCalculationContent['Client'] = currentElement.customerId;
        interestCalculationContent['Loan'] = currentElement.loan;
        interestCalculationContent['Accrual'] = currentElement.accrual;
        interestCalculationContent['Amount'] = currentElement.amount;
        fullPayment['MsgData'] = interestCalculationContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do4(List<AnalyticsRow4> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'InterestCalculation';
        Map<String, dynamic> interestCalculationContent = {};
        interestCalculationContent['ID'] = currentElement.id;
        interestCalculationContent['Dept'] = currentElement.dept;
        interestCalculationContent['Date'] = currentElement.soldDate;
        interestCalculationContent['Client'] = currentElement.customerId;
        interestCalculationContent['Loan'] = currentElement.loan;
        interestCalculationContent['Accrual'] = currentElement.accrual;
        interestCalculationContent['Amount'] = currentElement.amount;
        fullPayment['MsgData'] = interestCalculationContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do2(List<AnalyticsRow2> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'InterestCalculation';
        Map<String, dynamic> interestCalculationContent = {};
        interestCalculationContent['ID'] = currentElement.id;
        interestCalculationContent['Dept'] = currentElement.dept;
        interestCalculationContent['Date'] = currentElement.repaymentDate;
        interestCalculationContent['Client'] = currentElement.customerId;
        interestCalculationContent['Loan'] = currentElement.ticketId;
        interestCalculationContent['Accrual'] = currentElement.accrual;
        interestCalculationContent['Amount'] = currentElement.amount;
        fullPayment['MsgData'] = interestCalculationContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do7(List<AnalyticsRow7> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'InterestCalculation';
        Map<String, dynamic> interestCalculationContent = {};
        interestCalculationContent['ID'] = currentElement.id;
        interestCalculationContent['Dept'] = currentElement.dept;
        interestCalculationContent['Date'] = currentElement.soldDate;
        interestCalculationContent['Client'] = currentElement.customerId;
        interestCalculationContent['Loan'] = currentElement.loan;
        interestCalculationContent['Accrual'] = currentElement.accrual;
        interestCalculationContent['Amount'] = currentElement.amount;
        fullPayment['MsgData'] = interestCalculationContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do8(List<AnalyticsRow8> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'InterestCalculation';
        Map<String, dynamic> interestCalculationContent = {};
        interestCalculationContent['ID'] = currentElement.id;
        interestCalculationContent['Dept'] = currentElement.dept;
        interestCalculationContent['Date'] = currentElement.soldDate;
        interestCalculationContent['Client'] = currentElement.customerId;
        interestCalculationContent['Loan'] = currentElement.loan;
        interestCalculationContent['Accrual'] = currentElement.accrual;
        interestCalculationContent['Amount'] = currentElement.amount;
        fullPayment['MsgData'] = interestCalculationContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do9(List<AnalyticsRow9> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'InterestCalculation';
        Map<String, dynamic> interestCalculationContent = {};
        interestCalculationContent['ID'] = currentElement.id;
        interestCalculationContent['Dept'] = currentElement.dept;
        interestCalculationContent['Date'] = currentElement.soldDate;
        interestCalculationContent['Client'] = currentElement.customerId;
        interestCalculationContent['Loan'] = currentElement.loan;
        interestCalculationContent['Accrual'] = currentElement.accrual;
        interestCalculationContent['Amount'] = currentElement.amount;
        fullPayment['MsgData'] = interestCalculationContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do16(List<AnalyticsRow16> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullData = {};
        fullData['MsgId'] = ++cnt;
        fullData['MsgType'] = 'ClosedForeclosureSalePayment';
        Map<String, dynamic> closedForeclosureSalePaymentContent = {};
        closedForeclosureSalePaymentContent['ID'] = currentElement.id;
        closedForeclosureSalePaymentContent['Dept'] = currentElement.dept;
        closedForeclosureSalePaymentContent['PawnObjectBuyer'] =
            currentElement.pawnObjectBuyer;
        closedForeclosureSalePaymentContent['PawnObjectBuyerAgreement'] =
            currentElement.pawnObjectBuyerAgreement;
        closedForeclosureSalePaymentContent['Date'] =
            currentElement.soldByPartsDate;
        closedForeclosureSalePaymentContent['Client'] =
            currentElement.customerId;
        closedForeclosureSalePaymentContent['Loan'] = currentElement.ticketId;
        closedForeclosureSalePaymentContent['PawnAgreement'] =
            currentElement.ticketId;
        closedForeclosureSalePaymentContent['Amount'] = currentElement.amount;
        closedForeclosureSalePaymentContent['PrincipalAmount'] =
            currentElement.principalAmount;
        closedForeclosureSalePaymentContent['InterestAmount'] =
            currentElement.interestAmount;
        closedForeclosureSalePaymentContent['PaymentForm'] =
            currentElement.paymentForm;

        List<Map<String, dynamic>> pawnObjects = [];

        Map<String, dynamic> pawnobjectsClosedforeclosuresalepaymentcontent =
            {};
        pawnobjectsClosedforeclosuresalepaymentcontent['ID'] =
            currentElement.ticketObjectId;
        pawnobjectsClosedforeclosuresalepaymentcontent['PrincipalAmount'] =
            currentElement.principalAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['InterestAmount'] =
            currentElement.interestAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['PawnAmount'] =
            currentElement.pawnAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['Price'] =
            currentElement.sellPrice;
        pawnobjectsClosedforeclosuresalepaymentcontent['RefundAmount'] =
            currentElement.refundAmount;

        pawnObjects.add(pawnobjectsClosedforeclosuresalepaymentcontent);

        closedForeclosureSalePaymentContent['PawnObjects'] = pawnObjects;

        fullData['MsgData'] = closedForeclosureSalePaymentContent;
        toReturn.add(fullData);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do15(List<AnalyticsRow15> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullData = {};
        fullData['MsgId'] = ++cnt;
        fullData['MsgType'] = 'ClosedForeclosureSalePayment';
        Map<String, dynamic> closedForeclosureSalePaymentContent = {};
        closedForeclosureSalePaymentContent['ID'] = currentElement.id;
        closedForeclosureSalePaymentContent['Dept'] = currentElement.dept;
        closedForeclosureSalePaymentContent['PawnObjectBuyer'] =
            currentElement.pawnObjectBuyer;
        closedForeclosureSalePaymentContent['PawnObjectBuyerAgreement'] =
            currentElement.pawnObjectBuyerAgreement;
        closedForeclosureSalePaymentContent['Date'] =
            currentElement.soldByPartsDate;
        closedForeclosureSalePaymentContent['Client'] =
            currentElement.customerId;
        closedForeclosureSalePaymentContent['Loan'] = currentElement.ticketId;
        closedForeclosureSalePaymentContent['PawnAgreement'] =
            currentElement.ticketId;
        closedForeclosureSalePaymentContent['Amount'] = currentElement.amount;
        closedForeclosureSalePaymentContent['PrincipalAmount'] =
            currentElement.principalAmount;
        closedForeclosureSalePaymentContent['InterestAmount'] =
            currentElement.interestAmount;
        closedForeclosureSalePaymentContent['PaymentForm'] =
            currentElement.paymentForm;

        Map<String, dynamic> pawnobjectsClosedforeclosuresalepaymentcontent =
            {};
        pawnobjectsClosedforeclosuresalepaymentcontent['ID'] =
            currentElement.ticketObjectId;
        pawnobjectsClosedforeclosuresalepaymentcontent['PrincipalAmount'] =
            currentElement.principalAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['InterestAmount'] =
            currentElement.interestAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['PawnAmount'] =
            currentElement.pawnAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['Price'] =
            currentElement.sellPrice;
        pawnobjectsClosedforeclosuresalepaymentcontent['RefundAmount'] =
            currentElement.refundAmount;

        List<Map<String, dynamic>> newList = [];
        newList.add(pawnobjectsClosedforeclosuresalepaymentcontent);
        closedForeclosureSalePaymentContent['PawnObjects'] = newList;

        fullData['MsgData'] = closedForeclosureSalePaymentContent;
        toReturn.add(fullData);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do17(List<AnalyticsRow17> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullData = {};
        fullData['MsgId'] = ++cnt;
        fullData['MsgType'] = 'ClosedForeclosureSalePayment';
        Map<String, dynamic> closedForeclosureSalePaymentContent = {};
        closedForeclosureSalePaymentContent['ID'] = currentElement.id;
        closedForeclosureSalePaymentContent['Dept'] = currentElement.dept;
        closedForeclosureSalePaymentContent['PawnObjectBuyer'] =
            currentElement.pawnObjectBuyer;
        closedForeclosureSalePaymentContent['PawnObjectBuyerAgreement'] =
            currentElement.pawnObjectBuyerAgreement;
        closedForeclosureSalePaymentContent['Date'] =
            currentElement.soldByPartsDate;
        closedForeclosureSalePaymentContent['Client'] =
            currentElement.customerId;
        closedForeclosureSalePaymentContent['Loan'] = currentElement.ticketId;
        closedForeclosureSalePaymentContent['PawnAgreement'] =
            currentElement.ticketId;
        closedForeclosureSalePaymentContent['Amount'] = currentElement.amount;
        closedForeclosureSalePaymentContent['PrincipalAmount'] =
            currentElement.principalAmount;
        closedForeclosureSalePaymentContent['InterestAmount'] =
            currentElement.interestAmount;
        closedForeclosureSalePaymentContent['PaymentForm'] =
            currentElement.paymentForm;

        Map<String, dynamic> pawnobjectsClosedforeclosuresalepaymentcontent =
            {};
        pawnobjectsClosedforeclosuresalepaymentcontent['ID'] =
            currentElement.ticketObjectId;
        pawnobjectsClosedforeclosuresalepaymentcontent['PrincipalAmount'] =
            currentElement.principalAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['InterestAmount'] =
            currentElement.interestAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['PawnAmount'] =
            currentElement.pawnAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['Price'] =
            currentElement.sellPrice;
        pawnobjectsClosedforeclosuresalepaymentcontent['RefundAmount'] =
            currentElement.refundAmount;

        List<Map<String, dynamic>> newList = [];
        newList.add(pawnobjectsClosedforeclosuresalepaymentcontent);
        closedForeclosureSalePaymentContent['PawnObjects'] = newList;

        fullData['MsgData'] = closedForeclosureSalePaymentContent;
        toReturn.add(fullData);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do13(List<AnalyticsRow13> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullData = {};
        fullData['MsgId'] = ++cnt;
        fullData['MsgType'] = 'ClosedForeclosureSalePayment';
        Map<String, dynamic> closedForeclosureSalePaymentContent = {};
        closedForeclosureSalePaymentContent['ID'] = currentElement.ticketId;
        closedForeclosureSalePaymentContent['Dept'] = currentElement.dept;
        closedForeclosureSalePaymentContent['PawnObjectBuyer'] =
            currentElement.pawnObjectBuyer;
        closedForeclosureSalePaymentContent['PawnObjectBuyerAgreement'] =
            currentElement.pawnObjectBuyerAgreement;
        closedForeclosureSalePaymentContent['Date'] = currentElement.soldDate;
        closedForeclosureSalePaymentContent['Client'] =
            currentElement.customerId;
        closedForeclosureSalePaymentContent['Loan'] = currentElement.ticketId;
        closedForeclosureSalePaymentContent['PawnAgreement'] =
            currentElement.ticketId;
        closedForeclosureSalePaymentContent['Amount'] = currentElement.amount;
        closedForeclosureSalePaymentContent['PrincipalAmount'] =
            currentElement.principalAmountBefore;
        closedForeclosureSalePaymentContent['InterestAmount'] =
            currentElement.interestAmountBefore;
        closedForeclosureSalePaymentContent['PaymentForm'] =
            currentElement.paymentForm;

        List<Map<String, dynamic>> pawnObjects = [];

        Map<String, dynamic> pawnobjectsClosedforeclosuresalepaymentcontent =
            {};
        pawnobjectsClosedforeclosuresalepaymentcontent['ID'] =
            currentElement.ticketObjectId;
        pawnobjectsClosedforeclosuresalepaymentcontent['PrincipalAmount'] =
            currentElement.principalAmountAfter;
        pawnobjectsClosedforeclosuresalepaymentcontent['InterestAmount'] =
            currentElement.interestAmountAfter;
        pawnobjectsClosedforeclosuresalepaymentcontent['PawnAmount'] =
            currentElement.pawnAmount;
        pawnobjectsClosedforeclosuresalepaymentcontent['Price'] =
            currentElement.sellPrice;
        pawnobjectsClosedforeclosuresalepaymentcontent['RefundAmount'] =
            currentElement.refundAmount;
        pawnObjects.add(pawnobjectsClosedforeclosuresalepaymentcontent);

        closedForeclosureSalePaymentContent['PawnObjects'] = pawnObjects;

        fullData['MsgData'] = closedForeclosureSalePaymentContent;
        toReturn.add(fullData);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> do14(List<AnalyticsRow14> ticketList, String queryName) async {
    try {
      int cnt = 0;
      List<Map<String, dynamic>> toReturn = [];
      for (final e in ticketList) {
        var currentElement = e;
        Map<String, dynamic> fullPayment = {};
        fullPayment['MsgId'] = ++cnt;
        fullPayment['MsgType'] = 'FullPayment';
        Map<String, dynamic> fullPaymentContent = {};
        fullPaymentContent['ID'] = currentElement.id;
        fullPaymentContent['Dept'] = currentElement.dept;
        fullPaymentContent['Date'] = currentElement.repaymentDate;
        fullPaymentContent['Client'] = currentElement.customerId;
        fullPaymentContent['Loan'] = currentElement.ticketId;
        fullPaymentContent['Accrual'] = currentElement.accrual;
        fullPaymentContent['Amount'] = currentElement.amount;
        fullPaymentContent['paymentForm'] = currentElement.dept;
        fullPaymentContent['PaymentDate'] = currentElement.repaymentDate;
        fullPayment['MsgData'] = fullPaymentContent;
        toReturn.add(fullPayment);
      }
      var fileioresult = writeToFile(queryName, toReturn);

      return Future<bool>.value(fileioresult);
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> writeToFile(
      String fileName, List<Map<String, dynamic>> jsonObj) async {
    try {
      Encoding pipa = utf8;
      //final String curpath = '${Directory.current.path}\\Data\\';
      File file = File("Data/$fileName.json");
      await file.create(recursive: true);

      //final File file = File('Data/$fileName.json');

      file.writeAsStringSync(json.encode(jsonObj), encoding: pipa);
      return true;
    } on Exception catch (ex) {
      print(ex);
      return false;
    }
  }
}
