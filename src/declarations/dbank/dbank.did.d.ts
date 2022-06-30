import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'checkBalance' : ActorMethod<[], bigint>,
  'topUp' : ActorMethod<[bigint], undefined>,
  'withdrawl' : ActorMethod<[bigint], undefined>,
}
