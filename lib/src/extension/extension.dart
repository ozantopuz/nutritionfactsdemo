import '../models/fat.dart';
import '../models/trans_fat.dart';

extension StringExtension on String {
  get ignoreNull {
    if (this != null) {
      return this;
    } else {
      return '';
    }
  }
}

extension FatExtension on Fat {
  getValue(String unit) {
    if (this != null) {
      if (this.value != null) {
        return this.value.toStringAsFixed(0) + unit;
      } else {
        return '-';
      }
    } else {
      return '-';
    }
  }

  getDoubleValue() {
    if (this != null) {
      if (this.value != null) {
        return this.value;
      } else {
        return 0.toDouble();
      }
    } else {
      return 0.toDouble();
    }
  }
}

extension TransFatExtension on TransFat {
  getValue(String unit) {
    if (this != null) {
      if (this.value != null) {
        return this.value.toStringAsFixed(0) + unit;
      } else {
        return '-';
      }
    } else {
      return '-';
    }
  }

  getDoubleValue() {
    if (this != null) {
      if (this.value != null) {
        return this.value;
      } else {
        return 0.toDouble();
      }
    } else {
      return 0.toDouble();
    }
  }
}
