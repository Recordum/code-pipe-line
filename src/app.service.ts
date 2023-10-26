import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  healthCheck(): string {
    console.log('HEALTH_CHECK_SUCCESS');
    return 'health-check-success';
  }
}
